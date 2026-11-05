# RAXTRIXX WA TOOLKIT (Termux)

## Instalasi
```bash
pkg update -y
pkg install -y bash curl
bash install.sh
bash start.sh
```

## Fitur
- Format/validasi dasar nomor telepon Indonesia
- Membuat tautan chat resmi `https://wa.me/`
- Cek respons HTTP link undangan `chat.whatsapp.com`
- Catat nama grup, ID, status secara manual dari info yang terlihat di WhatsApp
- Buka WhatsApp

## Batasan
WhatsApp tidak menyediakan endpoint publik resmi untuk mengambil nama grup, Group ID, atau status/keanggotaan secara andal hanya dari tautan undangan. Respons HTTP bukan bukti grup aktif. Toolkit ini tidak mengakses akun privat atau mengambil data tanpa izin.
