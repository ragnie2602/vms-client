#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

SRC_FILE="ffmpeg_watchdog.cpp"
OUT_FILE="ffmpeg_watchdog.exe"
COMPILER="x86_64-w64-mingw32-g++"

# ✅ Console static build, không GUI, không DLL
CFLAGS="-std=c++17 -O2 -Wall -static -static-libgcc -static-libstdc++"

# ============================================================
# 🧹 Clean bản build cũ (nếu tồn tại)
# ============================================================
if [ -f "$OUT_FILE" ]; then
    echo "🧹 Cleaning old build: $OUT_FILE"
    rm -f "$OUT_FILE"
    if [ -f "$OUT_FILE" ]; then
        echo "⚠️ Warning: failed to delete old $OUT_FILE (file may be locked)"
    fi
fi

# ============================================================
# 🧱 Build mới
# ============================================================
echo "🔧 Building static ffmpeg_watchdog (console)..."
$COMPILER "$SRC_FILE" -o "$OUT_FILE" $CFLAGS

# ============================================================
# ✅ Kết quả build
# ============================================================
if [ $? -eq 0 ]; then
    echo "✅ Build thành công!"
    ls -lh "$OUT_FILE"
else
    echo "❌ Build thất bại!"
    exit 1
fi
