FROM debugging-docker-images

ENV NODE_ENV=development

RUN npm install -g nodemon grunt-cli

EXPOSE 5858 35729

CMD ["./web-dev.sh"]
