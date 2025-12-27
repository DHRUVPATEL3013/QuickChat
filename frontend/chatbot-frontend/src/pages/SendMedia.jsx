import axios from "axios";
import { useState, useRef } from "react";

function SendMedia({ token, recipient, getchats }) {
  const [file, setFile] = useState(null);
  const [caption, setCaption] = useState("");
  const [preview, setPreview] = useState(null);
  const fileInputRef = useRef(null);

  const handleFileSelect = (e) => {
    const selectedFile = e.target.files[0];
    if (selectedFile) {
      setFile(selectedFile);
      if (selectedFile.type.startsWith('image/')) {
        const reader = new FileReader();
        reader.onload = (e) => setPreview(e.target.result);
        reader.readAsDataURL(selectedFile);
      } else {
        setPreview(null); // For non-images, no preview
      }
    }
  };

  const removeFile = () => {
    setFile(null);
    setPreview(null);
    setCaption("");
    if (fileInputRef.current) {
      fileInputRef.current.value = "";
    }
  };

  const sendMedia = async () => {
    if (!file || !recipient) return;

    const formData = new FormData();
    formData.append("phone", recipient);
    formData.append("caption", caption);
    formData.append("file", file);

    try {
      await axios.post(
        "http://127.0.0.1:8000/send-media",
        formData,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "multipart/form-data",
          },
        }
      );

      removeFile();
      getchats();

    } catch (err) {
      console.error("Error sending media:", err);
    }
  };

  return (
    <div className="media-input-area">
      {!file ? (
        <>
          {/* File picker */}
          <input
            type="file"
            ref={fileInputRef}
            onChange={handleFileSelect}
            style={{ display: 'none' }}
            accept="image/*,video/*,audio/*,application/*"
            disabled={!recipient}
          />
          <button
            className="select-file-btn"
            onClick={() => fileInputRef.current.click()}
            disabled={!recipient}
          >
            📎 Select File
          </button>
        </>
      ) : (
        <div className="media-preview">
          <div className="preview-content">
            {preview ? (
              <img src={preview} alt="Preview" className="preview-image" />
            ) : (
              <div className="file-preview">
                <span className="file-icon">📎</span>
                <span className="file-name">{file.name}</span>
              </div>
            )}
            {/* Caption */}
            <input
              type="text"
              className="caption-input"
              placeholder="Add a caption (optional)"
              value={caption}
              onChange={(e) => setCaption(e.target.value)}
            />
          </div>
          <div className="media-actions">
            <button className="remove-media-btn" onClick={removeFile}>✕</button>
            <button className="send-media-btn" onClick={sendMedia}>Send</button>
          </div>
        </div>
      )}
    </div>
  );
}

export default SendMedia;
