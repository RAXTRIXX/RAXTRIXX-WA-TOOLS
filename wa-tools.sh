#!/data/data/com.termux/files/usr/bin/bash
CYAN='\\033[1;36m'; GREEN='\\033[1;32m'; YELLOW='\\033[1;33m'; RED='\\033[1;31m'; RESET='\\033[0m'
while true; do
 clear
 echo -e "${CYAN}╔══════════════════════════════════════════╗"
 echo "║       RAXTRIXX • WA TOOLKIT             ║"
 echo "╚══════════════════════════════════════════╝${RESET}"
 echo " [1] Check/format phone number (Indonesia)"
 echo " [2] Create WhatsApp chat link (wa.me)"
 echo " [3] Check group invite link response"
 echo " [4] Group info (manual visible fields)"
 echo " [5] Open WhatsApp"
 echo " [0] Exit"
 read -rp " RAXTRIXX > " opt
 case "$opt" in
  1|2)
   read -rp "Nomor (contoh 081234567890 atau +628123456789): " num
   num="${num//[[:space:]]/}"; num="${num//-/}"; num="${num//(/}"; num="${num//)/}"
   num="${num#+}"
   if [[ "$num" =~ ^0 ]]; then num="62${num#0}"; fi
   if [[ "$num" =~ ^8 ]]; then num="62${num}"; fi
   if [[ "$num" =~ ^[0-9]{8,15}$ ]]; then
     echo -e "${GREEN}Format angka: +$num${RESET}"
     echo "Link chat: https://wa.me/$num"
     if command -v termux-open-url >/dev/null; then
       read -rp "Buka link chat sekarang? (y/N): " a
       [[ "$a" =~ ^[Yy]$ ]] && termux-open-url "https://wa.me/$num"
     fi
   else echo -e "${RED}Format nomor tidak valid. Gunakan 8-15 digit angka.${RESET}"
   fi
   read -rp "Enter untuk kembali..." ;;
  3)
   read -rp "Link undangan grup (https://chat.whatsapp.com/...): " url
   if [[ "$url" =~ ^https?://(www\\.)?chat\\.whatsapp\\.com/ ]]; then
     echo "Memeriksa respons link..."
     curl -L -s -o /dev/null -w "HTTP status: %{http_code}\\nURL akhir: %{url_effective}\\n" --max-time 15 "$url"
     echo "Status HTTP bukan bukti grup aktif atau info keanggotaan."
   else echo -e "${YELLOW}Format link tidak cocok.${RESET}"
   fi
   read -rp "Enter untuk kembali..." ;;
  4)
   echo "Metadata grup tidak tersedia secara resmi dari link saja."
   read -rp "Nama grup (dilihat di WhatsApp): " name
   read -rp "Group ID (jika terlihat/tersedia): " gid
   read -rp "Status (mis. invite aktif/tidak diketahui): " status
   echo "---- Ringkasan ----"
   echo "Nama: $name"; echo "ID: $gid"; echo "Status: $status"
   read -rp "Enter untuk kembali..." ;;
  5)
   if command -v termux-open-url >/dev/null; then termux-open-url "https://wa.me/"
   else echo "Buka WhatsApp dari aplikasi."; fi
   read -rp "Enter untuk kembali..." ;;
  0) exit 0 ;;
  *) echo "Pilihan tidak valid"; sleep 1 ;;
 esac
done
