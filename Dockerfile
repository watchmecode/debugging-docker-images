FROM node:6.9.5-alpine

# use dumb-init to handle SIGINT, SIGTERM, etc
ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init  
RUN chmod +x /usr/local/bin/dumb-init

# put the app in the right folder
# be sure you have a .dockerignore file for COPY
RUN mkdir -p /var/app
WORKDIR /var/app
COPY ./ /var/app

# install build tools and production modules
RUN apk add --no-cache make gcc g++ python
RUN npm install --production

# environment variables and port numbers
ENV NODE_ENV=production NODE_PATH=./lib:.
EXPOSE 3000

# reduce permissions for account running app
RUN adduser -D app
USER app

# run it! use ENTRYPOINT and CMD for flexibility in 
# creating images from this image
ENTRYPOINT ["dumb-init"]
CMD ["node", "web/bin/www"]
