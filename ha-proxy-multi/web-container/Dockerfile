FROM node:latest
LABEL maintainer="vitali.shcharbin"

VOLUME ["/vagrant/web-application"]

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install && npm cache clean

COPY . /usr/src/app

CMD [ "npm", "start" ]

EXPOSE 80