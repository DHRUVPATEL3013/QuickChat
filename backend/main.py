from fastapi import FastAPI
from database import Base,engine
from fastapi.middleware.cors import CORSMiddleware
from routers import users,messages,web_s,contacts,add_contact,profile,send_media
from fastapi.staticfiles import StaticFiles

Base.metadata.create_all(bind=engine)

app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    # allow_origins=["http://localhost:5173", "http://127.0.0.1:5173"],
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
# app.mount("/static",StaticFiles(directory="static"),name="static")
# app.mount("/uploads", StaticFiles(directory="uploads"), name="uploads")
app.include_router(users.router, prefix="/auth")
app.include_router(messages.router)

app.include_router(web_s.router)
app.include_router(contacts.router)
app.include_router(add_contact.router)
app.include_router(profile.router)
app.include_router(send_media.router)



if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app,host="0.0.0.0",port=8000)