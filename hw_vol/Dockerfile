FROM ubuntu:20.04

# 设置非交互式模式，避免安装软件时的交互提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表并安装编译工具
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /workspace

# 默认命令
CMD ["bash"]
