FROM node:13.10.1-alpine3.11 

RUN apk upgrade

COPY ./etcd-browser /home/node/etcd-browser
WORKDIR /home/node/etcd-browser

EXPOSE 8000

CMD ["nodejs", "server.js"]
