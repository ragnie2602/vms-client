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

echo "=== Cleaning previous build cache ==="
make distclean || true
rm -f config.h config.log ffbuild/config.mak || true

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
  --enable-demuxer=rtsp,rtp,h264,hevc,aac,adts,mpegts,pcm_mulaw,pcm_alaw,rawvideo,rawaudio,wav \
  --enable-decoder=h264,hevc,aac,pcm_mulaw,pcm_alaw,pcm_s16le \
  --enable-parser=h264,hevc,aac \
  --enable-encoder=aac,pcm_s16le \
  --enable-muxer=adts,mpegts,matroska,mov,mp4,wav \
  --enable-filter=aresample,aformat,asetpts \
  \
  --enable-avformat \
  --enable-avcodec \
  --enable-avutil \
  --enable-avfilter \
  --enable-swresample \
  --enable-swscale \
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
echo "✅ FFmpeg build done"

# ============================================================
# 🧩 Build ffmpeg_watchdog sau khi FFmpeg xong
# ============================================================
cd ..
if [ -f "./build_watchdog.sh" ]; then
  echo "=== Building ffmpeg_watchdog static ==="
  bash build_watchdog.sh
else
  echo "⚠️ build_watchdog.sh not found — skip watchdog build"
fi

echo "✅ DONE"
