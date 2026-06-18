# HealthyPet - Google Play Compliance Summary

Dokumen ini berisi ringkasan yang menjelaskan bagaimana aplikasi HealthyPet menangani privasi data dan penghapusan akun. Anda dapat menyalin teks ini untuk digunakan pada halaman web (misalnya Google Sites, Notion, atau GitHub Pages) yang URL-nya akan Anda masukkan ke Google Play Console.

---

## 1. Privacy Policy (Kebijakan Privasi)

### Data Apa Saja yang Kami Kumpulkan?
HealthyPet mengumpulkan informasi berikut berdasarkan peran pengguna:
* **Informasi Profil Pengguna:** Nama lengkap, alamat email, nomor telepon, alamat (khusus dokter), dan foto profil (opsional).
* **Data Hewan Peliharaan:** Nama hewan, spesies, ras, usia, berat badan, jenis kelamin, dan foto hewan.
* **Data Rekam Medis & Kesehatan:** Riwayat diagnosis, catatan perawatan medis, rekomendasi dokter, jadwal vaksinasi, dan hasil analisis AI Scan.

### Mengapa Kami Mengumpulkan Data Tersebut?
Data dikumpulkan secara eksklusif untuk menyediakan layanan manajemen klinik hewan yang optimal, termasuk:
* Mengelola profil pengguna dan autentikasi yang aman.
* Memfasilitasi pencatatan rekam medis hewan peliharaan secara digital.
* Memberikan pengingat otomatis untuk jadwal vaksinasi (misalnya: Felocell, Defensor).
* Menyediakan fitur analisis AI Scan untuk mendeteksi kondisi hewan peliharaan.

### Siapa yang Memiliki Akses ke Data?
HealthyPet menggunakan arsitektur berbasis peran (Role-Based Access) yang ketat:
* **Pemilik Hewan (Pet Owner):** Hanya dapat melihat dan mengelola data profil mereka sendiri serta hewan peliharaan mereka.
* **Dokter Hewan (Veterinarian):** Dapat mengakses profil hewan untuk keperluan diagnosis, membuat rekam medis, dan mengelola jadwal vaksinasi.
* **Administrator:** Mengelola verifikasi pendaftaran dokter dan manajemen pengguna secara umum.

---

## 2. Account Deletion (Penghapusan Akun & Data)

Google Play mewajibkan aplikasi memiliki kebijakan penghapusan data yang jelas. Berikut adalah mekanisme di aplikasi HealthyPet:

### Bagaimana Cara Meminta Penghapusan Akun?
Pengguna dapat meminta penghapusan akun dan seluruh datanya melalui:
1. Tombol **"Hapus Akun"** yang tersedia di halaman **Pengaturan (Settings)** di dalam aplikasi.
2. Mengirimkan email permintaan penghapusan akun ke email administrator klinik/pengembang.

### Data Apa Saja yang Dihapus?
Sistem database HealthyPet (Supabase) menggunakan relasi hapus beruntun (*Cascading Deletes*). Ketika sebuah akun dihapus, sistem secara otomatis akan menghapus:
* Kredensial login pengguna (Autentikasi).
* Data profil pengguna.
* Seluruh data profil hewan peliharaan yang didaftarkan oleh pengguna tersebut.
* Seluruh riwayat rekam medis, jadwal vaksinasi, dan hasil AI Scan yang terhubung dengan hewan-hewan tersebut.
* File gambar/foto yang diunggah (Foto profil dan foto hewan di Storage Bucket).

### Retensi Data
Setelah proses penghapusan dieksekusi, data akan dihapus secara permanen dari server aktif kami. Beberapa residu data mungkin masih tersimpan dalam *backup* terenkripsi server paling lama 30 hari sebelum terhapus sepenuhnya. Tidak ada data rekam medis yang ditinggalkan tanpa kepemilikan (*orphaned records*).
