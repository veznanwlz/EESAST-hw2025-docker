#!/bin/bash

# 检查是否提供了程序名称作为参数
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <program>"
    exit 1
fi

program=$1

# 运行指定的程序
docker run -it --rm hw_copy $program#!/bin/bash
