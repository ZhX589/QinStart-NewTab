#!/bin/bash

# 轻启标签页 - 三平台构建脚本
# 用法: chmod +x build.sh && ./build.sh

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$PROJECT_DIR/src"
TEMP_DIR="$PROJECT_DIR/temp"
OUTPUT_DIR="$PROJECT_DIR"

echo "🧹 清理旧构建..."
rm -rf "$TEMP_DIR"
rm -f "$OUTPUT_DIR"/QinStart-NewTab_Firefox.xpi
rm -f "$OUTPUT_DIR"/QinStart-NewTab_GoogleChrome.zip
rm -f "$OUTPUT_DIR"/QinStart-NewTab_Edge.zip

echo "📁 创建临时目录..."
cp -r "$SRC_DIR" "$TEMP_DIR"

# ==================== Firefox ====================
echo "🦊 构建 Firefox 版本..."
cd "$TEMP_DIR"
zip -r -FS "$OUTPUT_DIR/QinStart-NewTab_Firefox.xpi" *
cd "$PROJECT_DIR"

# ==================== Chrome ====================
echo "🔵 构建 Chrome 版本..."
cp "$PROJECT_DIR/manifest-edge.json" "$TEMP_DIR/manifest.json"  # 先复制同结构文件
# 修改为 Chrome 版本（加上 homepage）
cat > "$TEMP_DIR/manifest.json" << 'CHROME_EOF'
{
  "manifest_version": 3,
  "name": "轻启标签页",
  "version": "1.0.0",
  "description": "简洁优雅的新标签页，实时时钟、必应搜索与一言语录相伴。",

  "chrome_url_overrides": {
    "newtab": "QinStartNewTaab.html"
  },

  "chrome_settings_overrides": {
    "homepage": "QinStartNewTaab.html"
  },

  "permissions": [],

  "content_security_policy": {
    "extension_pages": "script-src 'self'; style-src 'self' https://cdnjs.cloudflare.com; font-src 'self' https://cdnjs.cloudflare.com; connect-src https://v1.hitokoto.cn; img-src 'self' data: blob:;"
  },

  "icons": {
    "48": "icons/icon-48.png",
    "96": "icons/icon-96.png"
  }
}
CHROME_EOF

cd "$TEMP_DIR"
zip -r -FS "$OUTPUT_DIR/QinStart-NewTab_GoogleChrome.zip" *
cd "$PROJECT_DIR"

# ==================== Edge ====================
echo "🟢 构建 Edge 版本..."
cp "$PROJECT_DIR/manifest-edge.json" "$TEMP_DIR/manifest.json"

cd "$TEMP_DIR"
zip -r -FS "$OUTPUT_DIR/QinStart-NewTab_Edge.zip" *
cd "$PROJECT_DIR"

# ==================== 清理 ====================
echo "🧹 清理临时文件..."
rm -rf "$TEMP_DIR"

echo ""
echo "✅ 构建完成！"
echo "   Firefox:  $OUTPUT_DIR/QinStart-NewTab_Firefox.xpi"
echo "   Chrome:   $OUTPUT_DIR/QinStart-NewTab_GoogleChrome.zip"
echo "   Edge:     $OUTPUT_DIR/QinStart-NewTab_Edge.zip"
