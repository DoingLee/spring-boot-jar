
####################################### 方案一 #######################################

# 构建的镜像基于哪个镜像
FROM openjdk:8-jdk-alpine

#目录是相对于"上下文"（DockerFile所在目录）的
COPY target/spring-boot-frame-1.0-SNAPSHOT.jar /app.jar

# 启动容器时运行命令
# -Djava.security.egd=file:/dev/./urandom 是为了减少Tomcat的启动速度
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]


# 构建镜像：
# 在 Dockerfile 文件所在目录执行：
# docker build -t doing/spring-boot-jar .

# 创建容器：
# docker run -d --name spring_boot_jar -p 8081:8080 -v /Users/doing/Desktop/dockerVolumes/spring_boot_jar:/app doing/spring-boot-jar:latest

# 测试：
# curl http://127.0.0.1:8081/test
# 可以看到本地 /Users/doing/Desktop/dockerVolumes/spring_boot_jar/app-logs 打印出日志（失败）

# 启动容器：
#docker start spring-boot-jar:latest

# 日志仅能通过控制台看
# docker attach spring_boot_jar

####################################### 方案二 #######################################

#使用基于linux + jdk的镜像，把springboot jar cp进去
#https://c.163yun.com/hub#/m/repository/?repoId=3177
#docker pull hub.c.163.com/public/jdk:1.7.0_03

#mvn clean install

#docker run -d --name spring_boot_jar1 -p 8081:8080 -v /Users/doing/Desktop/dockerVolumes/spring_boot_jar:/root hub.c.163.com/public/jdk:1.7.0_03

#拷贝jar进docker：﻿
#docker cp /Users/doing/IdeaProjects/spring-boot-jar/target/spring-boot-frame-1.0-SNAPSHOT.jar spring_boot_jar1:/root/app.jar

#docker中启动应用：
#java -Djava.security.egd=file:/dev/./urandom -jar /root/app.jar

# 测试：
# curl http://127.0.0.1:8081/test
# 可以看到本地 /Users/doing/Desktop/dockerVolumes/spring_boot_jar/app-logs 打印出日志（成功）