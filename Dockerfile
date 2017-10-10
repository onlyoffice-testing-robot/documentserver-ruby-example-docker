FROM ruby:2.3
ENV DOC_SERVER_URL="http://external_ip:8080/"

LABEL maintainer="kvazilife@gmail.com"
ARG build_branch=master

RUN apt-get update && apt-get -y install nodejs
RUN git clone -b $build_branch https://github.com/flaminestone/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/ruby
RUN gem install bundler && bundler install
EXPOSE 80
CMD rails s -b 0.0.0.0 -p 80
