# documentserver-ruby-example-docker
Documentserver Ruby Example Docker

# How to start with documentserver

Attention: Your server should have real IP address accessible from Internet. Do not use inside corporate network with NAT.
```
BUILD_BRANCH="master" && \
ufw allow www && \
EXTERNAL_IP=$(curl ipinfo.io/ip) && \
git clone https://github.com/onlyoffice-testing-robot/documentserver-ruby-example-docker.git && \
sudo docker run -i -t -d -p 8080:80 \
    -v /app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice  \
    -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver && \
docker build --build-arg build_branch=$BUILD_BRANCH  -t documentserver-ruby-example documentserver-ruby-example-docker && \
docker run -itd -p 80:80 -e DOC_SERVER_URL="http://$EXTERNAL_IP"':8080' documentserver-ruby-example
```
