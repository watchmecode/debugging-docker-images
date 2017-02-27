FROM debugging-docker-images

# reset permissions back to root for installation
USER root

# adjust environment for development purposes
ENV NODE_ENV=development
EXPOSE 5858 35729

# install dev tools
RUN npm install -g nodemon grunt-cli

# reset user back to app, for lowered prmissions at runtime
USER app

# custom start up command to handle npm install
CMD ["./web-dev.sh"]
