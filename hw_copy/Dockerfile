FROM ubuntu:20.04

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装g++
RUN apt-get update && apt-get install -y g++

# 创建src目录
WORKDIR /src

# 将mul.cpp和add.cpp文件从宿主机复制到容器中的src目录
COPY mul.cpp ./mul.cpp
COPY add.cpp ./add.cpp

# 编译mul.cpp和add.cpp
RUN g++ -o mul mul.cpp
RUN g++ -o add add.cpp

# 设置容器启动时运行的默认命令（可以根据需要覆盖）
CMD ["echo", "Please specify the program to run: mul or add"]
