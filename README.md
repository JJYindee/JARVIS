# JARVIS OS V.2 (ผู้ช่วย AI อัจฉริยะประจำเครื่อง)

ระบบผู้ช่วย AI ประจำเครื่องด้วย **Gemini Live** พร้อมอินเทอร์เฟซ PyQt6 ดีไซน์ฟิวเจอร์ริสติก รองรับการสั่งงานด้วยเสียง Real-time, หน้าต่างควบคุมแบบแยกส่วน (Detachable Panels), มิเตอร์วัดจำนวนโทเคนคงเหลือ (Token Meter), ช่องเปลี่ยน API Key ในตัว และเครื่องมืออัตโนมัติครบครัน ทั้งการควบคุมเบราว์เซอร์, จัดการไฟล์, อ่านหน้าจอ และส่งข้อความ

JARVIS ยังมาพร้อมกับ **Presentation Studio** สำหรับสร้าง, แก้ไข, ปรับดีไซน์ และขยายสไลด์งานนำเสนอ `.pptx` แบบจอกว้าง (16:9) ได้จากเอกสาร, ข้อมูล, รูปภาพ, เสียง หรือวิดีโอ พร้อมตัวเลือกส่งออกเป็น PDF (ดูรายละเอียดเพิ่มเติมใน [คู่มือการใช้งาน](docs/USAGE.md#6-powerpoint-presentations))

---

## 📋 ข้อกำหนดของระบบ (Requirements)

จำเป็นต้องติดตั้ง **Python 3.11 ขึ้นไป** ในการตั้งค่าและเปิดใช้งาน JARVIS ตรวจสอบเวอร์ชัน Python ของคุณก่อนเริ่มใช้งาน:

```bash
python --version
```

---

## 🚀 วิธีเริ่มต้นใช้งานอย่างเร็ว (Quick Start)

เปิด Terminal หรือ Command Prompt แล้วรันคำสั่ง:

```bash
git clone https://github.com/MAL19INDUSTRIES/JARVIS-OS-V.2.git
cd JARVIS-OS-V.2
python scripts/setup_jarvis.py
```

> **สำหรับ Windows**: คุณสามารถดับเบิลคลิกที่ไฟล์ [`scripts/setup_jarvis.bat`](file:///c:/Users/USER/Desktop/JARVIS-OS-V.2-main/scripts/setup_jarvis.bat) หรือ [`scripts/start_jarvis.bat`](file:///c:/Users/USER/Desktop/JARVIS-OS-V.2-main/scripts/start_jarvis.bat) เพื่อตั้งค่าและเปิดใช้งานได้ทันที

เปิดไฟล์ `.env` เพื่อกรอก `GEMINI_API_KEY` ของคุณ (หรือกรอกและกดบันทึกผ่านการ์ดเปลี่ยน API Key ในหน้าจอ UI ได้โดยตรง) จากนั้นเปิดใช้งาน JARVIS:

```bash
jarvis
```

*(รันขั้นตอนการติดตั้งเพียงครั้งเดียว เมื่อเปิดหน้าต่าง Terminal ใหม่ ให้ Activate `.venv` แล้วพิมพ์ `jarvis` เพื่อเริ่มงานได้ทันที)*

---

## 🌟 ฟีเจอร์หลัก (Key Features)

1. **Gemini Live Real-time Audio**: สนทนาโต้ตอบเสียงแบบต่อเนื่อง สมูธ นุ่มนวล สมจริง พร้อมเลือกเสียงพากย์ได้หลากหลาย
2. **Context Token Meter**: แสดงจำนวนโทเคน Gemini คงเหลือ ( out of 1.05M tokens ) และสัดส่วนการใช้งานบนหน้าจอ UI แบบ Real-time
3. **Interactive API Key Manager**: ช่องกรอก, ตรวจสอบ (Verify) และบันทึก `GEMINI_API_KEY` ได้โดยตรงผ่านหน้าจออินเทอร์เฟซ
4. **Browser Automation**: ควบคุมเบราว์เซอร์เปิดเว็บ ค้นหา คลิก และป้อนข้อมูลอัตโนมัติ โดยเชื่อมต่อกับแท็บหลักและจดจำบัญชีที่ล็อกอินไว้
5. **Presentation Studio**: สร้างไฟล์งานนำเสนอ PowerPoint (`.pptx`) อัตโนมัติจากข้อมูล เสียง หรือวิดีโอ
6. **Desktop & System Tools**: เปิดแอปพลิเคชัน, อ่าน/เขียนไฟล์, อ่านหน้าจอ (Vision OCR), เช็กสภาพอากาศ และค้นหาเที่ยวบิน

---

## 🌐 ระบบเว็บแอปพลิเคชัน (Hosted Web Stack)

โปรเจกต์นี้มาพร้อมบริการระบบเว็บแบบหลายผู้ใช้ (Multi-user) พัฒนาด้วย FastAPI และ Next.js:
- ระบบผู้ใช้แยกหน่วยความจำ (Memory) และคอนฟิกด้วย Postgres
- จำกัดโควต้าคำขอด้วย Redis
- ถอดรหัส API Key ของผู้ใช้แบบปลอดภัย และเชื่อมต่อ Gemini Live ผ่าน Authenticated WebSocket

รันระบบ Web Stack ทั้งหมดด้วย Docker:

```bash
docker compose up --build
```

แล้วเข้าใช้งานที่ `http://localhost:3000`

---

## 🛠️ การติดตั้งแบบ Manual (Manual Setup)

```bash
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
cp .env.example .env
./scripts/install_jarvis_cli.sh
jarvis
```

---

## 🧪 การทดสอบระบบ (Self-Test & QA Audit)

ทดสอบการทำงานของระบบ เครื่องมือ และสัญญาการเชื่อมต่อทั้งหมดของ JARVIS:

```bash
jarvis --self-test
```

ระบบจะทำการทดสอบฟังก์ชันเสียง, การสืบค้นเบราว์เซอร์, การจัดการไฟล์, ความจำ และ Vision โดยไม่ส่งผลกระทบกับข้อมูลจริง ผลการทดสอบจะถูกบันทึกเป็นรายงาน JSON ในโฟลเดอร์ `.qa-artifacts/`

---

## 📚 เอกสารประกอบการใช้งาน (Documentation)

- [คู่มือการใช้งานอย่างละเอียด (Usage Guide)](docs/USAGE.md)
- [บทเรียนเริ่มต้นใช้งาน (Tutorial)](docs/TUTORIAL.md)
- [คู่มือการตรวจสอบบั๊กและ QA Audit](docs/QA.md)
- [แนวทางการร่วมพัฒนา (Contribution Notes)](CONTRIBUTING.md)

---

## 📜 ลิขสิทธิ์ (License)

ซอฟต์แวร์นี้เผยแพร่ภายใต้ **MIT License** ดูรายละเอียดเพิ่มเติมได้ในไฟล์ [LICENSE](LICENSE)
