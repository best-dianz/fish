# Menggunakan image Java 17 resmi yang ringan sebagai dasarnya
FROM eclipse-temurin:17-jre-alpine

# Membuat direktori kerja di dalam server virtual Koyeb
WORKDIR /opt/lavalink

# KODE BARU: Menginstal library libc6-compat dan libgcc yang dibutuhkan JDA-NAS
RUN apk add --no-cache libc6-compat libgcc

# Mengunduh file Lavalink.jar versi terbaru langsung saat proses build
RUN wget https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar -O Lavalink.jar

# Menyalin file application.yml dari GitHub kamu ke dalam server Koyeb
COPY application.yml application.yml

# Membuka port 8080 agar bisa diakses oleh bot Discord kamu
EXPOSE 8080

# Kode perintah utama untuk menjalankan Lavalink
CMD ["java", "-jar", "Lavalink.jar"]
