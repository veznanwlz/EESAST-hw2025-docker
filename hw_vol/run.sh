#!/bin/bash

# 检查参数数量
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <source_file> <output_file> [compile_args...]"
    echo "Example: $0 hello.c hello -Wall -O2"
    exit 1
fi

# 获取参数
SOURCE_FILE=$1
OUTPUT_FILE=$2
shift 2
COMPILE_ARGS="$@"

# 检查源文件是否存在
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' not found."
    exit 1
fi

# 获取源文件所在目录的绝对路径
SOURCE_DIR=$(dirname "$(realpath "$SOURCE_FILE")")
SOURCE_FILENAME=$(basename "$SOURCE_FILE")

# 构建Docker镜像（如果尚未构建）
if ! docker images | grep -q "hw_compiler"; then
    echo "Building Docker image..."
    docker build -t hw_compiler hw_vol/
fi

# 运行容器并编译文件
echo "Compiling $SOURCE_FILE..."
docker run -it --rm \
    -v "$SOURCE_DIR:/workspace" \
    hw_compiler \
    gcc $COMPILE_ARGS -o "/workspace/$OUTPUT_FILE" "/workspace/$SOURCE_FILENAME"

# 检查编译是否成功
if [ $? -eq 0 ] && [ -f "$SOURCE_DIR/$OUTPUT_FILE" ]; then
    echo "Compilation successful. Output file: $SOURCE_DIR/$OUTPUT_FILE"
else
    echo "Compilation failed."
    exit 1
fi
