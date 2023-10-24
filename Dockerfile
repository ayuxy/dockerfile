# 使用官方的Ruby镜像作为基础镜像
FROM ruby:2.7

# 设置工作目录
WORKDIR /app

# 复制Jekyll博客源代码到容器中
COPY . /app

# 安装Jekyll和其他必要的依赖
RUN gem install bundler && \
    bundle install

# 删除原始文件，如果需要的话
# RUN rm -rf /app/*

# 暴露Jekyll默认的本地开发端口
EXPOSE 4000

# 设置容器的入口点为一个空的shell脚本
# 这个脚本将允许用户自己执行bundle相关命令
ENTRYPOINT ["/bin/sh", "-c"]
