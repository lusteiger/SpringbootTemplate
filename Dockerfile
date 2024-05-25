# 使用官方的 JDK 17 镜像作为基础
FROM openjdk:17-jdk-slim

# 设置工作目录
WORKDIR /app

# 将 Gradle Wrapper 脚本复制到镜像中
COPY gradlew .
COPY gradle ./gradle

# 复制项目文件到镜像中
COPY . .

# 使用 Gradle Wrapper 执行打包
RUN ./gradlew build

# 设置 Spring Boot 应用程序的启动命令
CMD ["java", "-jar", "/app/build/libs/demo-0.0.1-SNAPSHOT.jar"]
