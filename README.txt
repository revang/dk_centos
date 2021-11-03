######################### 创建删除 #########################

# 编译镜像
docker build -t dk_centos:1.0 .

# 删除镜像
docker rmi dk_centos:1.0

# 创建容器
docker run --name centos_1 -it dk_centos:1.0

# 删除容器
docker rm centos_1

######################### 使用说明 #########################

# 退出（不关闭容器）
ctrl+p ctrl+q

# 退出（并关闭容器）
exit

# 进入容器（容器未关闭）
docker attach container_name

# 进入容器（容器已关闭）
dcstart
