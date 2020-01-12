var=$(docker images -f "dangling=true" -q)
if [ ! -z "$var" ];then
   # Если есть промежуточные образы, то удаляем их
   docker rmi -f $(docker images -f "dangling=true" -q)
fi
# Удаление завершивших свою работу образов
#  docker rm -f $(docker ps -f status=exited -q)