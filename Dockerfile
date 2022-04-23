# 从一个最小版本的node镜像开始，版本为12
FROM node:12-alpine
# 安装必要的组件，apk 是 alpine中的内置工具。 apline是一个特殊的linux发行版，很小。它没有常见的apt工具。
RUN apk add --no-cache python2 g++ make
# 设置工作目录。如果不存在会创建。注意，后续都会在这个基地址上面进行操作。
WORKDIR /app
# 把当前Dockerfile同目录的内容，全部复制到容器的/app目录下面。
COPY . .
# 安装node项目的依赖项
RUN yarn install --production
# 运行这个node应用程序
CMD ["node","src/index.js"]
