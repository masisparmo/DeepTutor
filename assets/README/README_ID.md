<div align="center">

<p align="center"><img src="../../assets/figs/logo/logo.png" alt="Logo DeepTutor" height="56" style="vertical-align: middle;">&nbsp;<img src="../../assets/figs/logo/banner.png" alt="DeepTutor" height="48" style="vertical-align: middle;"></p>

# DeepTutor: Bimbingan Belajar Personal Sepanjang Hayat

<p align="center">
  <a href="https://deeptutor.info" target="_blank"><img alt="Dokumentasi — deeptutor.info" src="https://img.shields.io/badge/Docs-deeptutor.info%20%E2%86%97-0A0A0A?style=for-the-badge&labelColor=F5F5F4" height="36"></a>&nbsp;
  <a href="https://deeptutor.info/collaborate/" target="_blank"><img alt="Kolaborasi — Bekerja bersama kami" src="https://img.shields.io/badge/Collaborate-work%20with%20us%20%E2%86%97-0A0A0A?style=for-the-badge&labelColor=F5F5F4" height="36"></a>
</p>

<p align="center">
<a href="https://www.star-history.com/hkuds/deeptutor"><picture><source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/badge?repo=HKUDS/DeepTutor&amp;type=trending&amp;theme=dark"><source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/badge?repo=HKUDS/DeepTutor&amp;type=trending"><img alt="GitHub Trending Repository of the Day" src="https://api.star-history.com/badge?repo=HKUDS/DeepTutor&amp;type=trending" height="55"></picture></a>&#32;<a href="https://trendshift.io/repositories/17099"><img src="https://trendshift.io/api/badge/trendshift/repositories/17099/daily" alt="HKUDS/DeepTutor | Trendshift" width="250" height="55"></a>&#32;<a href="https://www.star-history.com/hkuds/deeptutor"><picture><source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/badge?repo=HKUDS/DeepTutor&amp;theme=dark"><source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/badge?repo=HKUDS/DeepTutor"><img alt="Star History Rank" src="https://api.star-history.com/badge?repo=HKUDS/DeepTutor" width="185" height="55"></picture></a>
</p>

<p align="center">
  <a href="../../README.md"><img alt="English" height="40" src="https://img.shields.io/badge/English-CDCFD4"></a>&nbsp;
  <a href="README_CN.md"><img alt="简体中文" height="40" src="https://img.shields.io/badge/简体中文-CDCFD4"></a>&nbsp;
  <a href="README_TW.md"><img alt="繁體中文" height="40" src="https://img.shields.io/badge/繁體中文-CDCFD4"></a>&nbsp;
  <a href="README_JA.md"><img alt="日本語" height="40" src="https://img.shields.io/badge/日本語-CDCFD4"></a>&nbsp;
  <a href="README_ES.md"><img alt="Español" height="40" src="https://img.shields.io/badge/Español-CDCFD4"></a>&nbsp;
  <a href="README_FR.md"><img alt="Français" height="40" src="https://img.shields.io/badge/Français-CDCFD4"></a>&nbsp;
  <a href="README_AR.md"><img alt="Arabic" height="40" src="https://img.shields.io/badge/Arabic-CDCFD4"></a>&nbsp;
  <a href="README_RU.md"><img alt="Русский" height="40" src="https://img.shields.io/badge/Русский-CDCFD4"></a>&nbsp;
  <a href="README_HI.md"><img alt="Hindi" height="40" src="https://img.shields.io/badge/Hindi-CDCFD4"></a>&nbsp;
  <a href="README_PT.md"><img alt="Português" height="40" src="https://img.shields.io/badge/Português-CDCFD4"></a>&nbsp;
  <a href="README_TH.md"><img alt="Thai" height="40" src="https://img.shields.io/badge/Thai-CDCFD4"></a>&nbsp;
  <a href="README_PL.md"><img alt="Polski" height="40" src="https://img.shields.io/badge/Polski-CDCFD4"></a>&nbsp;
  <a href="README_ID.md"><img alt="Bahasa Indonesia" height="40" src="https://img.shields.io/badge/Bahasa%20Indonesia-BCDCF7"></a>
</p>

[![Python 3.11+](https://img.shields.io/badge/Python-3.11%2B-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/downloads/)
[![Next.js 16](https://img.shields.io/badge/Next.js-16-000000?style=flat-square&logo=next.js&logoColor=white)](https://nextjs.org/)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue?style=flat-square)](../../LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/HKUDS/DeepTutor?style=flat-square&color=brightgreen)](https://github.com/HKUDS/DeepTutor/releases)
[![arXiv](https://img.shields.io/badge/arXiv-2604.26962-b31b1b?style=flat-square&logo=arxiv&logoColor=white)](https://arxiv.org/abs/2604.26962)

[Fitur Unggulan](#-fitur-unggulan) · [Pembaruan Edisi Indonesia](#-pembaruan-khusus-edisi-indonesia) · [Mulai Cepat](#-panduan-mulai-cepat) · [Tutorial Lengkap](../../TUTORIAL_LENGKAP_DEEPTUTOR.md) · [CLI](#%EF%B8%8F-deeptutor-cli)

</div>

---

### 🇮🇩 Pembaruan Khusus (Indonesian Enhanced Edition)

Fork ini menghadirkan peningkatan khusus untuk pengguna di Indonesia dan optimasi performa backend:

1. **Dukungan Penuh Bahasa Indonesia Baku (KBBI)**
   - **Antarmuka Pengguna (UI)**: Penerjemahan lengkap seluruh menu navigasi, pengaturan, riwayat obrolan, dan status sistem ke dalam Bahasa Indonesia (`web/locales/id/`).
   - **Model Output Language**: Pilihan eksplisit `Bahasa Indonesia` (`id`).
   - **Aturan Tata Bahasa Tegas (Anti-Malay Vocabulary Confusion)**: Prompt sistem dilengkapi direktif khusus agar AI selalu memakai kosakata resmi Bahasa Indonesia dan melarang pencampuran istilah serumpun (misal: *maklumat* $\rightarrow$ *informasi*, *senarai* $\rightarrow$ *daftar*, *muat turun* $\rightarrow$ *unduh*, *tetapan* $\rightarrow$ *pengaturan*, *cipta* $\rightarrow$ *buat*, *fail* $\rightarrow$ *berkas*, *pautan* $\rightarrow$ *tautan*).

2. **Multi-API Key Pool & Auto-Rotation (Load Balancing + 429 Failover)**
   - Mendukung pengisian banyak API key (dipisahkan koma atau baris baru) pada kolom API Key Google Gemini atau penyedia OpenAI-compatible.
   - Distribusi request secara bergiliran (*round-robin*) antar kunci yang terdaftar.
   - Rotasi otomatis seketika saat terjadi kuota habis / rate limit (`HTTP 429 Too Many Requests`), sehingga proses belajar mengajar tidak terputus.

3. **Penyempurnaan Integrasi Model Gemini**
   - Penyesuaian ke model Gemini terbaru (`gemini-2.5-flash`, `gemini-3.8-flash`, `gemini-flash-lite-latest`).
   - Penanganan otomatis parameter `reasoning_effort` (`minimal` / `minimum` dipetakan ke `"low"` pada provider Gemini) untuk mencegah galat `HTTP 400 Invalid Argument: Thinking level MINIMAL is not supported`.

4. **Peningkatan Tampilan Pengaturan Peralatan (Tools Toggle UI)**
   - Tombol toggle switch alat bantu (tools) diperbesar dengan aksen warna hijau emerald kontras tinggi (`bg-emerald-500`).
   - Dilengkapi indikator teks eksplisit **"Aktif"** (hijau tebal) dan **"Nonaktif"** (abu-abu) di samping tombol toggle, sehingga status aktif/tidaknya alat terlihat dengan sangat jelas.

5. **Perbaikan Port Sambungan WebSocket Frontend Standalone**
   - Deteksi port dinamis yang andal (`BACKEND_PORT=8001`) pada Next.js client standalone sehingga tidak terjadi galat koneksi `ECONNREFUSED` saat dijalankan mandiri.

6. **Panduan Lengkap & Mandiri**
   - Dilengkapi berkas panduan komprehensif dalam Bahasa Indonesia: [TUTORIAL_LENGKAP_DEEPTUTOR.md](../../TUTORIAL_LENGKAP_DEEPTUTOR.md).

7. **Dukungan Penuh Seluruh Capabilities Termasuk Math Animator & Manim**
   - Pustaka animasi matematika Manim (`manim>=0.19.0`) dan integrasi FFmpeg siap pakai, memungkinkan fitur **Math Animator** dan **Visualize (Manim Video)** membuat konsep animasi dan merender video pembelajaran matematika secara langsung tanpa galat *missing optional dependencies*.

---

## ✨ Fitur Unggulan

DeepTutor adalah ruang kerja pembelajaran berbasis agen (*agent-native*) yang menggabungkan bimbingan belajar personal, penyelesaian masalah, pembuatan kuis interaktif, riset mendalam, visualisasi ilmiah, dan penguasaan materi dalam satu sistem terintegrasi.

- **Satu Runtime untuk Semua Mode** — Chat, Tanya Jawab, Kuis, Riset Mendalam (Deep Research), Visualisasi Interaktif, Pemecahan Masalah (Deep Solve), Kursus Mandiri, Alur Penguasaan (Mastery Path), dan Membaca Imersif (Immersive Reading).
- **Task Board (Papan Tugas)** — Pantau tugas belajar dalam kolom Belum Selesai (*To do*), Sedang Dikerjakan (*In progress*), dan Selesai (*Done*), dengan dukungan catatan, drag-and-drop, serta arsip yang dapat dipulihkan kapan saja.
- **Konteks Pembelajaran Terhubung** — Basis pengetahuan (Knowledge Base/RAG), buku digital, draf tulisan bersama (Co-Writer), buku catatan (*Notebook*), bank soal, persona tutor, dan Memori tersimpan dapat digunakan lintas alur kerja.
- **Pembelajaran Video Imersif** — Masukkan tautan YouTube atau Bilibili ke menu Membaca (*Reading*) untuk pemutaran video, pencarian transkrip, bimbingan berdasarkan penanda waktu (*timestamp*), serta penyimpanan catatan otomatis.
- **Sub-agen dan Partners** — Konsultasikan pertanyaan langsung dengan agen coding lokal (seperti Claude Code, Codex, Grok CLI, Antigravity, Kimi, opencode, MiMo, Hermes) atau mitra tutor virtual dengan kepribadian dan pengetahuan unik.
- **Basis Pengetahuan Multi-Mesin (RAG)** — Mendukung mesin indeks LlamaIndex, PageIndex, GraphRAG, LightRAG, WeKnora, Tencent IMA, MarginNote 4, arsip Kiwix ZIM, dan Obsidian Vault.
- **Peralatan dan Keterampilan yang Dapat Diperluas** — Dilengkapi alat bawaan (*web search*, *paper search*, *reasoning*, *geogebra*, *imagegen*, *videogen*), server MCP, aplikasi CLI, serta pustaka keahlian dari komunitas EduHub.
- **Memori yang Transparan & Dapat Diedit** — L1 (jejak riwayat), L2 (fakta pembelajaran), dan L3 (sintesis preferensi belajar) dapat dilihat dan disesuaikan langsung oleh pengguna.

---

## 🚀 Panduan Mulai Cepat

### Prasyarat Sistem
- **Python**: 3.11 hingga 3.14
- **Node.js**: versi 20+ (disarankan Node.js 22 LTS)
- **Koneksi Internet**: Untuk mengunduh dependensi dan mengakses API LLM

### 1. Menjalankan Menggunakan Source Code (Lokal)

```powershell
# 1. Buka folder Deep Tutor
cd "d:\Aplikasi\Deep Tutor"

# 2. Aktifkan virtual environment Python
.\.venv\Scripts\Activate.ps1

# 3. Jalankan backend server (Port 8001)
python -m deeptutor_cli.main serve --port 8001
```

Di jendela terminal terpisah, jalankan antarmuka web Next.js:

```powershell
cd "d:\Aplikasi\Deep Tutor\web"

# Menjalankan server standalone web (Port 3782)
$env:PORT="3782"; $env:BACKEND_PORT="8001"; $env:NEXT_PUBLIC_API_BASE="http://127.0.0.1:8001"; node .next\standalone\server.js
```

Buka peramban (browser) di alamat: **[http://localhost:3782](http://localhost:3782)**

---

### 2. Konfigurasi Bahasa Indonesia

1. Buka menu **Settings (Pengaturan)** di bilah sisi kiri.
2. Pada bagian **General (Umum) / Language**:
   - **Interface Language (Bahasa antarmuka)**: Pilih **Bahasa Indonesia**.
   - **Model Output Language (Bahasa respons model)**: Pilih **Bahasa Indonesia**.
3. Klik simpan atau perubahan akan otomatis tersimpan. Seluruh antarmuka dan respons AI selanjutnya akan menggunakan Bahasa Indonesia baku.

---

### 3. Konfigurasi Model AI & Multi-API Key Pooling

1. Masuk ke **Settings $\rightarrow$ Providers**.
2. Pilih penyedia model Anda (contoh: **Gemini**).
3. Pada kolom **API Key**, Anda dapat memasukkan beberapa kunci API sekaligus yang dipisahkan dengan koma atau baris baru:
   ```text
   AIzaSyD-KUNCI-PERTAMA-ANDA, AIzaSyD-KUNCI-KEDUA-ANDA, AIzaSyD-KUNCI-KETIGA-ANDA
   ```
4. Pada menu **Language Models**:
   - Pilih model utama untuk Chat: `gemini-2.5-flash` atau `gemini-3.8-flash`.
   - Pilih model penalaran (Reasoning): `gemini-2.5-flash` / `gemini-2.5-pro`.

Sistem akan otomatis merotasi kunci API tersebut secara bergantian dan langsung berpindah ke kunci cadangan jika salah satu kuota limit tercapai.

---

### 4. Mengatur Peralatan (Tools)

Buka menu **Settings $\rightarrow$ Peralatan (Tools)**:
- Setiap alat bantu (*brainstorm*, *web_search*, *reason*, *paper_search*, *geogebra_analysis*, *imagegen*, *videogen*) kini dilengkapi dengan tombol sakelar hijau emerald yang jelas.
- Status setiap alat terlihat langsung melalui label teks **"Aktif"** berwarna hijau atau **"Nonaktif"** berwarna abu-abu.
- Aktifkan alat sesuai kebutuhan belajar Anda.

---

## 📖 Dokumentasi Lengkap

Untuk panduan instalasi dari nol, pemecahan masalah (troubleshooting), integrasi file PDF lokal, dan konfigurasi tingkat lanjut, silakan baca:
👉 **[TUTORIAL_LENGKAP_DEEPTUTOR.md](../../TUTORIAL_LENGKAP_DEEPTUTOR.md)**

---

## 📄 Lisensi

DeepTutor didistribusikan di bawah lisensi [Apache 2.0](../../LICENSE).
