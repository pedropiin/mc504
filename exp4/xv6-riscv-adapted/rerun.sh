sudo docker rm xv6-risc-container
sudo docker image rm xv6-risc
sudo docker build -t xv6-risc .
sudo docker create -ti --name xv6-risc-container xv6-risc
sudo docker start -i xv6-risc-container
