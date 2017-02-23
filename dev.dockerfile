FROM debugging-docker-images

# reset user for image build
USER root

# adjust environment for development purposes
ENV NODE_ENV=development
EXPOSE 5858 35729

# install dev tools
RUN npm install -g nodemon grunt-cli

# ensure correct user to run app
USER app

# custom start up command to handle npm install
CMD ["./web-dev.sh"]
