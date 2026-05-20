#!/bin/bash

# CCNU-thesis 初始化脚本
# 用于下载必要的字体资源文件

set -e

# 字体文件配置
FONT_DIR="font"
FONT_URLS=(
    "https://cos.huimengxinhe.com/font/simkai.ttf"
    "https://cos.huimengxinhe.com/font/simsun.ttc"
)

# 颜色输出
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "========================================"
echo "  CCNU-thesis 项目初始化"
echo "========================================"
echo ""

# 创建字体目录
if [ ! -d "$FONT_DIR" ]; then
    echo -e "${YELLOW}创建字体目录: $FONT_DIR${NC}"
    mkdir -p "$FONT_DIR"
else
    echo -e "${GREEN}字体目录已存在: $FONT_DIR${NC}"
fi

echo ""
echo "开始下载字体文件..."
echo ""

# 下载字体文件（使用 Python urllib，不依赖 curl/wget）
for url in "${FONT_URLS[@]}"; do
    filename=$(basename "$url")
    filepath="$FONT_DIR/$filename"
    
    if [ -f "$filepath" ]; then
        echo -e "${GREEN}✓ $filename 已存在，跳过下载${NC}"
    else
        echo -e "${YELLOW}↓ 正在下载: $filename${NC}"
        if python3 -c "
import urllib.request
import sys
try:
    urllib.request.urlretrieve('$url', '$filepath')
    sys.exit(0)
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"; then
            echo -e "${GREEN}✓ $filename 下载成功${NC}"
        else
            echo -e "${RED}✗ $filename 下载失败${NC}"
            exit 1
        fi
    fi
done

echo ""
echo "========================================"
echo -e "${GREEN}  初始化完成！${NC}"
echo "========================================"
echo ""
echo "字体文件列表:"
ls -lh "$FONT_DIR"