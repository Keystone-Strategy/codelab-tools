from node:14 as base 
ENV GOPATH=/root/go \
    GOROOT=/usr/local/go

WORKDIR /app
RUN curl -O https://dl.google.com/go/go1.21.0.linux-amd64.tar.gz &&\
    tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz && \
    mv /usr/local/go/bin/* /usr/bin/ 

RUN pushd claat && go build && popd #github.com/googlecodelabs/tools/claat@latest 

COPY . .


RUN cd /app/site && npm install 
RUN npm install -g gulp-cli

ENV PATH=$PATH:/root/go/bin:/app/site/node_modules/.bin

WORKDIR /app/site

