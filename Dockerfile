FROM node:6.9.5-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init  
RUN chmod +x /usr/local/bin/dumb-init

RUN mkdir -p /var/app

WORKDIR /var/app

COPY ./ /var/app

RUN npm install --production

ENV NODE_ENV=production NODE_PATH=./lib:.

EXPOSE 3000

ENTRYPOINT ["dumb-init"]

CMD ["node", "web/bin/www"]
