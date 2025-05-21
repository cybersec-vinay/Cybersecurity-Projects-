# 🔐 Steganography GUI Tool

A user-friendly **Python-based GUI application** that allows users to **hide secret messages inside image files** using the **Least Significant Bit (LSB)** steganography technique.

This tool offers an intuitive graphical interface with password protection, message compression, drag-and-drop support, and color/font customization, making it ideal for secure, user-friendly data hiding.

> Built using Python, Tkinter, PIL (Pillow), and Stegano.

---

## 🖼 Features

- 🔐 **Password Protection** – Encrypt messages using a basic password-based method.
- 📂 **Drag & Drop Support** – Quickly load images by dragging them into the app.
- 📸 **Image Format Support** – Works with PNG, JPG, JPEG, and BMP formats.
- 📦 **Message Compression** – Reduce the message size before embedding.
- 🎨 **Custom Font and Color** – Customize message box font and text color.
- 📜 **Message History Logging** – Automatically log all decoded messages.
- 🌐 **Multilingual Message Support** – Store messages in any language (Unicode supported).
- 👁️ **Live Image Preview** – Instantly preview the image being encoded/decoded.

---

## 🛠 Tech Stack

This tool is built using the following libraries and frameworks:

- **Python 3.x**
- **Tkinter** – For GUI design
- **TkinterDnD2** – Enables drag and drop support
- **Pillow (PIL)** – Image processing and preview
- **Stegano** – Used for LSB-based steganography
- **zlib** – Optional compression support
- **base64** – Encoding/decoding and encryption-like behavior

---

## 📦 Installation

### ✅ Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/Steganography-GUI-Tool.git
cd Steganography-GUI-Tool
````

### ✅ Step 2: Install Dependencies

```bash
pip install -r requirements.txt
```

> ⚠️ Ensure Python 3 is installed on your machine.

---

## 🚀 Usage Guide

### 🔐 Encode a Message

1. Launch the app using `python steg_gui_app.py`.
2. Select or drag an image into the preview window.
3. Type your secret message in the message box.
4. You’ll be prompted to enter a password.
5. Optionally check "Compress Message".
6. Click on **🔐 Encode Message** to embed and save the output image.

### 🔓 Decode a Message

1. Select an image that contains a hidden message.
2. Enter the password when prompted.
3. Check "Decompress After Decode" if compression was used.
4. Click on **🔓 Decode Message** to view the original message.

Decoded messages are also saved in a log file (`decoded_log.txt`) with timestamps.

---

## 🖼 GUI Preview

Below is a screenshot of the Steganography GUI Tool:

![App Screenshot](images/preview.png)

---

## 🗂 Project Structure

```
Steganography-GUI-Tool/
├── steg_gui_app.py            # Main GUI application
├── requirements.txt           # Python dependencies
├── images/                    # Screenshots for README
│   └── preview.png
├── README.md                  # Project documentation
└── LICENSE                    # License file (optional)
```

---

## 🔐 How Password Encryption & Compression Work

### 📦 Compression (Optional)

* Uses `zlib` to compress the input message before encoding.
* Saves storage space and improves encoding efficiency.

### 🔐 Password Protection

* Password + Message → Combined as `password::message`
* Then base64-encoded to simulate encryption.
* During decoding, the password is validated before showing the actual message.

### 🔓 Decryption Flow

1. Extract base64 message from image using LSB.
2. Decode base64 to get original string.
3. Split string by `::` to verify password.
4. If compression was used, decompress and show message.

---

## 🧪 Sample Decoded Output (from decoded\_log.txt)

```
[2025-05-16 15:02:01] Hello, this is a top-secret message hidden using Steganography!
[2025-05-16 15:06:20] नमस्ते! यह एक गुप्त संदेश है।
```

---

## 📌 Future Enhancements

* [ ] AES-256 Secure Encryption Support
* [ ] QR Code Generator for Message Sharing
* [ ] Export Hidden Messages to PDF
* [ ] Multi-language GUI (English, Hindi, Kannada, etc.)
* [ ] One-click .exe packaging for Windows
* [ ] Real-time binary bit visualizer

---

## 📝 License

This project is licensed under the [MIT License](LICENSE).

---

## 👤 Author

* **Vinay Raghavendra**
* GitHub: [Cybersec-vinay](https://github.com/cybersec-vinay/Cybersecurity-Projects-)
* LinkedIn: [Vinay Raghavendra](https://www.linkedin.com/in/vinay-raghavendra-a7a0b7329/)
