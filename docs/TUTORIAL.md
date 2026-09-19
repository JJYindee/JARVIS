# JARVIS — บทเรียนเริ่มต้นใช้งานตั้งแต่ติดตั้งจนถึงรันครั้งแรก (Tutorial)

คู่มือนี้จะนำคุณตั้งแต่ "พึ่งคลิกดาวน์โหลด" จนถึงการมีผู้ช่วยสั่งการด้วยเสียงพร้อมใช้งานในครั้งเดียว เลือกเส้นทางที่เหมาะกับคุณ:

- **[เส้นทาง 5 นาที (ไม่ต้องใช้ Terminal)](#เส้นทาง-5-นาที-ไม่ต้องใช้-terminal)** — ดาวน์โหลดไฟล์ ZIP, ดับเบิลคลิกตัวรัน, แล้วเริ่มคุยกับ JARVIS (รองรับทั้ง Windows และ macOS)
- **[เส้นทางสำหรับนักพัฒนา (Git + venv)](#เส้นทางสำหรับนักพัฒนา-git--venv)** — `git clone`, ตั้งค่า `python -m venv` และรันผ่าน Command Line

---

## 📌 สิ่งที่ต้องเตรียมก่อนเริ่มต้น

ไม่ว่าจะเลือกเส้นทางใด คุณต้องมี 3 สิ่งนี้ก่อน:

1. **Google Gemini API key**: ขอรับได้ฟรีที่ [aistudio.google.com/apikey](https://aistudio.google.com/apikey)
2. **ไมโครโฟนที่ใช้งานได้** พร้อมเปิดอนุญาตสิทธิ์สิทธิ์การใช้งาน
3. **ระบบปฏิบัติการที่รองรับ**: Windows 10/11, macOS หรือ Linux

---

## ⚡ เส้นทาง 5 นาที (ไม่ต้องใช้ Terminal)

### 1. ดาวน์โหลดไฟล์ ZIP
1. ไปที่หน้า GitHub Repository ของ JARVIS
2. กดปุ่มสีเขียว **`<> Code`** แล้วเลือก **Download ZIP**
3. เมื่อดาวน์โหลดเสร็จแล้ว ให้แตกไฟล์ (Unzip)
4. ย้ายโฟลเดอร์ที่แตกไฟล์ไปไว้ในที่ที่ปลอดภัย (เช่น `C:\Apps\` บน Windows) *หลีกเลี่ยงการวางใน OneDrive หรือ Cloud Sync*

### 2. รับ Gemini API Key
1. ไปที่ [aistudio.google.com/apikey](https://aistudio.google.com/apikey)
2. กด **Create API key** และก๊อปปี้รหัสคีย์เก็บไว้

### 3. ตั้งค่าไฟล์ `.env`
1. ในโฟลเดอร์ JARVIS ให้ก๊อปปี้ไฟล์ชื่อ `.env.example`
2. เปลี่ยนชื่อไฟล์คัดลอกนั้นเป็น `.env` (มีจุดนำหน้า)
3. เปิดไฟล์ `.env` ด้วยโปรแกรมแก้ไขข้อความ (Notepad, VS Code ฯลฯ)
4. วางรหัสคีย์ของคุณแทนที่ `YOUR_GEMINI_API_KEY` แล้วบันทึกไฟล์

### 4. เปิดใช้งาน JARVIS

> **สำหรับ Windows:**
> 1. เข้าไปที่โฟลเดอร์ `scripts/`
> 2. ดับเบิลคลิกไฟล์ **`start_jarvis.bat`**
> 3. ในการเปิดครั้งแรก ระบบจะทำการสร้าง Virtual Environment และติดตั้งไลบรารีที่จำเป็น (ใช้เวลาประมาณ 2-5 นาที)
> 4. การเปิดในครั้งต่อๆ ไป จะใช้เวลาเพียงไม่กี่วินาทีเท่านั้น!

---

## 💻 เส้นทางสำหรับนักพัฒนา (Git + venv)

```bash
git clone https://github.com/MAL19INDUSTRIES/JARVIS-OS-V.2.git jarvis
cd jarvis

python3 -m venv .venv
source .venv/bin/activate       # บน macOS / Linux
# .\.venv\Scripts\activate     # บน Windows PowerShell

python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m playwright install    # สำหรับเครื่องมือเปิดเบราว์เซอร์อัตโนมัติ

cp .env.example .env
# แก้ไข GEMINI_API_KEY ในไฟล์ .env

jarvis
```

---

## 🗣️ ทดลองสั่งงานครั้งแรก

เมื่อหน้าต่าง UI ของ JARVIS เปิดขึ้นมา ให้ลองพูดว่า:

> *"สวัสดี JARVIS คุณทำอะไรได้บ้าง?"*

JARVIS จะตอบกลับด้วยเสียงพูดทันที! (หรือพิมพ์ข้อความสั่งการผ่านช่องใส่ข้อความบนหน้าต่าง UI ก็ได้เช่นกัน)

---

## 🛠️ การแก้ไขปัญหาที่พบบ่อย (Troubleshooting)

### "GEMINI_API_KEY environment variable not set"
- ตรวจสอบว่าชื่อไฟล์คือ `.env` (มีจุดนำหน้า) และวางอยู่ในโฟลเดอร์หลักของโปรเจกต์
- ตรวจสอบว่าใส่ API key จริงแทนที่ `YOUR_GEMINI_API_KEY` เรียบร้อยแล้ว

### ไมโครโฟนไม่ทำงาน
- **Windows**: ไปที่ Settings → Privacy → Microphone ตรวจสอบว่าเปิด "Let desktop apps access your microphone" แล้ว
- **macOS**: ไปที่ System Settings → Privacy & Security → Microphone ตรวจสอบว่าอนุญาตสิทธิ์ Terminal หรือแอปพลิเคชันแล้ว
