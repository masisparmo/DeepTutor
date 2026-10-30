# Panduan Lengkap & Database Prompt Siap Pakai DeepTutor
> Berdasarkan Dokumentasi Resmi [docs.deeptutor.info](https://docs.deeptutor.info/) & Arsitektur HKU Data Intelligence Lab

---

## DAFTAR ISI
1. [Arsitektur & Konsep Inti DeepTutor](#1-arsitektur--konsep-inti-deeptutor)
2. [Navigasi & Fitur Antarmuka Web UI](#2-navigasi--fitur-antarmuka-web-ui)
3. [Panduan DeepTutor CLI & Perintah Penting](#3-panduan-deeptutor-cli--perintah-penting)
4. [Mekanisme Multi-API Key & Pool Failover](#4-mekanisme-multi-api-key--pool-failover)
5. [Database Template Prompt Siap Pakai](#5-database-template-prompt-siap-pakai)
   - [Kategori A: Deep Solve (Pemecahan Soal Sains & Matematika)](#kategori-a-deep-solve)
   - [Kategori B: Immersive Reading & Analisis Dokumen (PDF / Ebook)](#kategori-b-immersive-reading--analisis-dokumen)
   - [Kategori C: Deep Research & Riset Ilmiah Komprehensif](#kategori-c-deep-research)
   - [Kategori D: Visualize & Animasi Matematika (Manim / Chart / SVG)](#kategori-d-visualize--animasi-matematika)
   - [Kategori E: Deep Question (Pembuat Kuis & Ujian Bertingkat)](#kategori-e-deep-question)
   - [Kategori F: Socratic Tutor & Mastery Path (Belajar Terpandu)](#kategori-f-socratic-tutor--mastery-path)
   - [Kategori G: Co-Writer (Penulisan Makalah, Esai, & Buku)](#kategori-g-co-writer)

---

## 1. Arsitektur & Konsep Inti DeepTutor

DeepTutor adalah *agent-native personalized learning companion*. Sistem ini bukan chatbot biasa berbalut prompt sederhana, melainkan dirancang dengan arsitektur dua lapis (*two-layer plugin model*) dan sistem memori tiga tingkat (*three-layer memory system*):

```
                          ┌───────────────────────────┐
                          │   DeepTutor User Entry    │
                          │ Web UI / CLI / SDK / Bot  │
                          └─────────────┬─────────────┘
                                        ▼
                          ┌───────────────────────────┐
                          │   TurnApplicationService  │
                          │    & ChatOrchestrator     │
                          └──────┬─────────────┬──────┘
                                 │             │
        ┌────────────────────────▼───┐     ┌───▼────────────────────────┐
        │     Level 1: TOOLS         │     │   Level 2: CAPABILITIES    │
        │ • brainstorm   • web_search│     │ • chat        • deep_solve │
        │ • paper_search • reason    │     │ • visualize   • deep_quest │
        │ • geogebra     • imagegen  │     │ • math_anim   • deep_rsrch │
        │ • rag/exec     • videogen  │     │ • mastery_path• reading    │
        └────────────────────────────┘     └────────────────────────────┘
```

### A. Level 1: Tools (Alat Eksekusi On-Demand)
Alat-alat mandiri yang dipanggil oleh model sesuai kebutuhan turn:
- **`reason`**: Proses pemikiran deduktif mendalam sebelum menjawab.
- **`web_search`**: Pencarian web terkini lengkap dengan sitasi sumber.
- **`paper_search`**: Pencarian jurnal preprint ilmiah di arXiv.
- **`geogebra_analysis`**: Menerjemahkan visualisasi matematika ke perintah GeoGebra.
- **`brainstorm`**: Eksplorasi ide divergen dengan analisis rasional.
- **`rag` & `exec`**: Pengambilan referensi dari dokumen lokal dan eksekusi komputasi skrip Python di lingkungan sandbox.

### B. Level 2: Capabilities (Pipeline Multi-Tahap)
Pipeline khusus yang mengendalikan seluruh siklus turn:
1. **`chat`** *(Default)*: Siklus agen *exploring* → *responding*.
2. **`deep_solve`**: Mengurai soal sulit matematika/sains langkah demi langkah dan memvalidasi kebenaran rumusnya.
3. **`deep_research`**: Pipeline riset ilmiah: *rephrasing* → *decomposing* → *researching* → *synthesis report*.
4. **`visualize` & `math_animator`**: Merender visualisasi interaktif SVG/Chart.js/Mermaid atau video animasi matematika berbasis **Manim**.
5. **`mastery_path`**: Mode bimbingan terpandu (*guided learning*) untuk memastikan penguasaan materi topik per topik.
6. **`immersive_reading`**: Membaca buku teks/PDF dengan navigasi sitasi langsung ke halaman terkait.
7. **`deep_question`**: Generator kuis, soal latihan analitis, dan tes diagnostik Bloom's Taxonomy.

### C. Sistem Memori Tiga Tingkat (3-Layer Memory)
- **L1 (Working Memory / Trace)**: Konteks aktif percakapan saat ini.
- **L2 (Surface Memory / Sessions)**: Riwayat sesi dan topik yang pernah didiskusikan.
- **L3 (Episodic & Semantic Profile)**: Pemahaman jangka panjang tentang preferensi belajar, kebiasaan, dan profil pengguna.

---

## 2. Navigasi & Fitur Antarmuka Web UI

Akses antarmuka web di: `http://localhost:3782`

| Fitur / Halaman | Deskripsi & Panduan Penggunaan |
| :--- | :--- |
| **Home / Chat** | Ruang interaksi agen utama. Terdapat tombol lampiran file/PDF, status reasoning, tool calling ekspansif, dan streaming langsung. |
| **Partners** | Menghubungkan agen tutor ke aplikasi perpesanan instan (IM) seperti Telegram, Discord, Slack, WhatsApp, WeChat. |
| **Personalized Learning / Mastery Path** | Membuka peta jalan belajar terstruktur dengan evaluasi otomatis kesiapan konsep. |
| **Learning Space & Task Board** | Mengelola catatan belajar, buku catatan (*notebooks*), serta papan tugas belajar. |
| **Knowledge Center (KB)** | Mengunggah dokumen/e-book ke Knowledge Base agar DeepTutor dapat menjawab pertanyaan berbasis sitasi akurat (RAG). |
| **Settings** | Mengonfigurasi model LLM, pool multi-API key (Gemini, Groq, OpenAI), embedding, dan search engine. |

---

## 3. Panduan DeepTutor CLI & Perintah Penting

DeepTutor dapat dijalankan dan dikontrol penuh melalui terminal:

```bash
# 1. Menjalankan Chat Interaktif di Terminal (REPL)
deeptutor chat

# 2. Menjalankan Capability Langsung (One-Shot Execution)
deeptutor run chat "Jelaskan konsep Transformasi Fourier dengan bahasa santai"
deeptutor run deep_solve "Hitung turunan dari f(x) = x^3 * sin(x)"
deeptutor run deep_research "Mekanisme attention pada Transformer" --config mode=report
deeptutor run visualize "Buatkan visualisasi diagram siklus Carnot"
deeptutor run math_animator "Visualisasikan deret Fourier"

# 3. Manajemen Knowledge Base (RAG)
deeptutor kb list
deeptutor kb create ilmu-cinta --doc "The_Power_of_Pujian_dan_Ungkapan_Cinta-final.pdf"
deeptutor kb search ilmu-cinta "Mengapa pujian harus spesifik?"
deeptutor kb eval ilmu-cinta --dataset qa.jsonl

# 4. Manajemen Memori
deeptutor memory show
deeptutor memory clear

# 5. Menjalankan Server Backend & Frontend
deeptutor start                   # Menjalankan backend (8001) + frontend (3782)
deeptutor serve --port 8001       # Menjalankan backend API saja
```

---

## 4. Mekanisme Multi-API Key & Pool Failover

Untuk mengatasi keterbatasan limit kuota (HTTP 429) pada API provider gratis/freemium, DeepTutor mendukung **Multi-API Key Pool** dengan sistem rotasi **Round-Robin** otomatis:
- Konfigurasi tersimpan pada file `data/user/settings/model_catalog.json`.
- Nilai `api_key` dapat berupa array kunci `["KEY_1", "KEY_2", "KEY_3", ...]`.
- Modul `KeyPool` ([deeptutor/services/keypool.py](file:///d:/Aplikasi/Deep%20Tutor/deeptutor/services/keypool.py)) secara otomatis menggilir kunci pada setiap permintaan dan memberikan jeda *cooldown* 60 detik jika salah satu kunci terkena pembatasan kuota (*rate limit*).

---

## 5. Database Template Prompt Siap Pakai

Gunakan template di bawah ini dengan menyalin dan mengganti teks di dalam kurung siku `[...]`.

---

### Kategori A: Deep Solve
#### Template A1: Pembongkaran Soal Sains & Matematika Bertahap
```text
[MODE: DEEP SOLVE]
Tolong selesaikan soal berikut secara sistematis dan detail:
[TULISKAN SOAL ATAU PERSAMAAN DISINI]

Format penyelesaian:
1. Identifikasi Variabel & Asumsi Dasar: Tentukan apa yang diketahui dan apa yang dicari.
2. Konsep & Rumus Kunci: Jelaskan prinsip sains/matematika yang mendasari.
3. Langkah Komputasi: Tunjukkan langkah kalkulasi tahap demi tahap secara eksplisit.
4. Verifikasi & Uji Batas (Sanity Check): Periksa apakah satuan dan ordenya masuk akal.
5. Intisari Intuisi: Berikan 1 paragraf penjelasan intuitif mengapa hasil tersebut seperti itu.
```

#### Template A2: Diagnosa Kesalahan Pengerjaan (Step-by-Step Debugging)
```text
Saya mencoba menyelesaikan soal berikut:
[SOAL]

Berikut adalah jalan pengerjaan saya yang tampaknya keliru:
[LANGKAH PENGERJAAN SAYA]

Tugasmu:
1. Tunjukkan di baris/langkah mana tepatnya letak kesalahan logika atau perhitungannya.
2. Jelaskan mengapa langkah tersebut keliru secara konsep.
3. Berikan koreksi yang benar dan jelaskan cara mencegah kekeliruan serupa di masa depan.
```

---

### Kategori B: Immersive Reading & Analisis Dokumen
#### Template B1: Ringkasan Eksekutif & Sintesis Inti Buku (PDF / Ebook)
```text
Berdasarkan dokumen/PDF [NAMA DOKUMEN] yang ada di workspace:
1. Buatkan ringkasan eksekutif (Executive Summary) dalam 3 paragraf padat.
2. Ekstrak 5 wawasan terpenting (Core Takeaways) yang paling dapat diterapkan di dunia nyata.
3. Sertakan kutipan atau rujukan halaman spesifik untuk setiap poin tersebut.
4. Tuliskan dalam bahasa Indonesia yang elegan dan mudah dipahami.
```

#### Template B2: Telaah Kritis Paper Ilmiah (Academic Peer-Review Style)
```text
Pelajari jurnal/dokumen yang terlampir ini dan berikan telaah kritis:
1. Pertanyaan Riset Utama: Masalah apa yang ingin dipecahkan oleh penulis?
2. Metodologi: Bagaimana eksperimen atau pengumpulan data dilakukan?
3. Temuan Kunci: Apa data empiris utama yang mendukung kesimpulan mereka?
4. Keterbatasan & Celah (Limitations & Gaps): Apa kekurangan yang belum terjawab dalam tulisan ini?
5. Implikasi Praktis: Bagaimana temuan ini relevan dengan bidang [MASUKKAN BIDANG ANDA]?
```

---

### Kategori C: Deep Research
#### Template C1: Laporan Riset Komparatif Multiperspektif
```text
[MODE: DEEP RESEARCH]
Lakukan riset mendalam mengenai topik: "[TOPIK RISET, CONTOH: Arsitektur SSM (Mamba) vs Transformer dalam Long-Context Processing]".

Struktur laporan yang diminta:
1. Latar Belakang & Motivasi Perkembangan
2. Perbandingan Teknis (Sertakan tabel komparasi parameter, kecepatan inferensi, efisiensi memori)
3. Hasil Benchmark Terkini dari Paper Ilmiah
4. Kelebihan, Kelemahan, dan Kasus Penggunaan Ideal Masing-masing
5. Prediksi Arah Tren dalam 2–3 Tahun ke Depan
Sertakan referensi sitasi yang valid.
```

---

### Kategori D: Visualize & Animasi Matematika
#### Template D1: Visualisasi Interaktif Alur Proses (Mermaid / SVG / Chart.js)
```text
[MODE: VISUALIZE]
Tolong visualisasikan konsep: [CONTOH: Siklus Hidup Permintaan HTTP dari Browser ke Server hingga Database].

Ketentuan:
1. Tampilkan visualisasi interaktif/diagram yang jelas dan modern.
2. Gunakan diagram alur (Mermaid / SVG) dengan pewarnaan yang rapi dan label yang jelas.
3. Berikan keterangan pendukung di bawah diagram untuk menjelaskan setiap transisi fase.
```

#### Template D2: Animasi Matematika Dinamis (Manim Animator)
```text
[MODE: MATH ANIMATOR]
Buatkan rancangan dan kode animasi Manim untuk menjelaskan konsep:
[CONTOH: Teorema Pythagoras atau Penjumlahan Vektor secara Grafis].

Fokus pada:
- Visual yang intuitif dengan transisi geometri yang mulus.
- Penyorotan (highlight) sudut dan sisi dengan warna yang kontras.
- Anotasi teks penjelasan yang sinkron dengan gerakan bangun.
```

---

### Kategori E: Deep Question
#### Template E1: Generator Ujian Diagnostik Bertingkat (Bloom's Taxonomy)
```text
[MODE: DEEP QUESTION]
Buatkan 5 soal uji pemahaman bertingkat untuk materi: [MASUKKAN TOPIK, CONTOH: Termodinamika Dasar].

Tingkatan soal yang dibuat:
- Soal 1: Pemahaman Konseptual (Level Recall & Understanding)
- Soal 2: Analisis Kasus Sederhana (Level Application)
- Soal 3: Jebakan Konsep / Misconception Trap (Soal yang sering salah dipahami)
- Soal 4: Kalkulasi Kuantitatif Tingkat Menengah (Level Analysis)
- Soal 5: Soal Sintesis / Pemecahan Masalah Terbuka (Level Evaluation)

Sertakan kunci jawaban tersembunyi dan rubrik penjelasan mengapa pilihan jawaban lain salah.
```

---

### Kategori F: Socratic Tutor & Mastery Path
#### Template F1: Mentor Belajar Terpandu (Metode Sokratik)
```text
Bertindaklah sebagai Tutor Ahli yang ramah dan menggunakan Metode Sokratik.
Saya ingin mempelajari materi: [TOPIK BELAJAR].

Aturan interaksi:
1. JANGAN langsung memberikan jawaban panjang atau seluruh materi sekaligus.
2. Mulailah dengan menguji pemahaman awal saya lewat 1 pertanyaan konseptual yang memancing pemikiran.
3. Tanggapi jawaban saya: berikan apresiasi jika tepat, luruskan jika ada kekeliruan, lalu ajukan pertanyaan berikutnya untuk membawa saya ke konsep yang lebih dalam.
4. Gunakan analogi dunia nyata ketika konsep mulai terasa abstrak.
```

---

### Kategori G: Co-Writer
#### Template G1: Kolaborasi Penulisan Naskah / Modul Pembelajaran
```text
[MODE: CO-WRITER]
Bantu saya menyusun modul pembelajaran interaktif mengenai: [TOPIK MODUL].

Target pembaca: [CONTOH: Mahasiswa Tingkat Pertama / Pemula].
Struktur modul:
1. Hook Pembuka & Studi Kasus Nyata
2. Dekonstruksi Konsep Inti (Gunakan gaya bahasa percakapan profesional)
3. Contoh Praktis & Ilustrasi Kerja
4. Rangkuman Cepat (Cheat Sheet)
5. 3 Latihan Mandiri beserta Petunjuk Pengerjaan
```

---
*Dokumentasi ini dibuat untuk pengguna DeepTutor Indonesia. Sumber referensi resmi: [https://docs.deeptutor.info/](https://docs.deeptutor.info/)*
