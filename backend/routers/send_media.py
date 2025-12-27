from fastapi import APIRouter,Depends,HTTPException,File,Form,UploadFile
from database import get_db
from models import User,Message
from sqlalchemy.orm import Session
from core.oauth2 import get_current_user
from models import MessageStatus
from schemass import MessageOut
from typing import List
from ws_manager import manager
from .messages import serialize_message
import os
import uuid
import cloudinary
import cloudinary.uploader
router=APIRouter()
UPLOAD_DIR="uploads"
@router.post("/send-media",response_model=List[MessageOut])
async def send_media(
    phone:str=Form(...),
    caption:str=Form(None),
    file:UploadFile=File(...),
    current_user:User=Depends(get_current_user),db:Session=Depends(get_db)):
    recipient=db.query(User).filter(User.phone==phone).first()
    if not recipient:
        raise HTTPException(status_code=404,detail="User Not Found")

    # ext=file.filename.split(".")[-1]
    # file_name=f"{current_user.phone}_{recipient.phone}_{uuid.uuid4()}_{file.filename}"
   
    # media_folder="images" if file.content_type.startswith("image") else "files"
    # os.makedirs(f"{UPLOAD_DIR}/{media_folder}",exist_ok=True) if not os.path.exists(f"{UPLOAD_DIR}/{media_folder}") else None
    # file_path=f"{UPLOAD_DIR}/{media_folder}/{file_name}"


    # with open(file_path,"wb") as buffer:
    #     buffer.write(await file.read())

    # media_url=f"/{file_path}"

    file_content=await file.read()
    folder="images" if file.content_type.startswith("image") else "files"
    upload_result=cloudinary.uploader.upload(
        file_content,
        folder=folder,
        public_id=f"{current_user.phone}_{recipient.phone}_{uuid.uuid4()}_{file.filename}",
        resource_type="auto"
    )
    media_url=upload_result["secure_url"]
    

        
    try:
        new_media=Message(
            sender_id=current_user.id,
            recipient_id=recipient.id,
            content=caption,
            media_url=media_url,
            media_type=file.content_type,
            is_bot_response=False,
            status=MessageStatus.sent.value
        )
        db.add(new_media)
        db.commit()     
        db.refresh(new_media)
        if manager.is_online(str(phone)):
            try:
                new_media.status=MessageStatus.delivered
                db.commit()
                db.refresh(new_media)
                payload={"type":"message","data":serialize_message(new_media,db)}

                await manager.send_personal(phone,payload)
            except Exception as e:
                print(f"Error sending to recipient {phone}: {e}")   
        else:
            print("recipient is offline")   

        try:
            payload={"type":"message","data":serialize_message(new_media,db)}
            await manager.send_personal(current_user.phone,payload)
        except Exception as e:
            print(f"Error sending to sender {current_user.phone}: {e}")
        messages_to_return=[serialize_message(new_media,db)]
        return messages_to_return   
    except Exception as e:
        print(f"Unexpected error in send_media: {e}")
        return []



    # file_content = await file.read()

    # # Determine folder based on content type
    # folder = "images" if file.content_type.startswith("image") else "files"

    # # Upload to Cloudinary
    # try:
    #     upload_result = cloudinary.uploader.upload(
    #         file_content,
    #         folder=folder,
    #         public_id=f"{current_user.phone}_{recipient.phone}_{uuid.uuid4()}_{file.filename}",
    #         resource_type="auto"
    #     )
    #     media_url = upload_result['secure_url']