#!/usr/bin/bash
set -e

echo "MSYSTEM = $MSYSTEM"

pacman -S --needed --noconfirm \
  mingw-w64-x86_64-binutils \
  mingw-w64-x86_64-toolchain \
  mingw-w64-x86_64-gcc \
  mingw-w64-x86_64-gcc-libgfortran

if [ ! -d "FFmpeg" ]; then
  echo "=== FFmpeg folder not found → cloning ==="
  git clone https://github.com/FFmpeg/FFmpeg.git
elif [ ! -f "FFmpeg/configure" ]; then
  echo "⚠️ FFmpeg folder exists but invalid → recloning"
  rm -rf FFmpeg
  git clone https://github.com/FFmpeg/FFmpeg.git
else
  echo "✅ FFmpeg folder found → continue"
fi

cd FFmpeg

echo "=== Configuring FFmpeg ==="
./configure \
  --disable-everything \
  --extra-ldflags=-static \
  \
  --disable-autodetect \
  --disable-debug \
  --disable-doc \
  --disable-programs \
  --enable-ffmpeg \
  --disable-ffprobe \
  --disable-ffplay \
  \
  --enable-static \
  --disable-shared \
  --disable-w32threads \
  --enable-pthreads \
  --pkg-config-flags="--static" \
  --extra-cflags="-static" \
  --extra-ldflags="-static" \
  --extra-ldexeflags="-static" \
  \
  --enable-protocol=* \
  \
  --enable-demuxer=rtsp \
  --enable-demuxer=rtp \
  --enable-demuxer=h264 \
  --enable-demuxer=hevc \
  --enable-demuxer=aac \
  --enable-demuxer=pcm_mulaw \
  --enable-demuxer=pcm_alaw \
  \
  --enable-parser=h264 \
  --enable-parser=hevc \
  --enable-parser=aac \
  \
  --enable-muxer=matroska \
  --enable-muxer=mov \
  --enable-muxer=mp4 \
  \
  --enable-encoder=aac \
  \
  --enable-avformat \
  --enable-avcodec \
  --enable-avutil \
  --enable-swresample \
  \
  --enable-small

echo "=== Building FFmpeg Minimal Static ==="
make -j$(nproc)

echo "=== Stripping symbols ==="
strip ffmpeg.exe || true

echo "=== Compressing with UPX ==="
if command -v upx &> /dev/null; then
  upx --best --lzma ffmpeg.exe
else
  echo "⚠️ UPX không tìm thấy — bỏ qua bước nén"
fi

echo "=== Exporting build ==="
cp -u ffmpeg.exe ../

echo "✅ DONE"
