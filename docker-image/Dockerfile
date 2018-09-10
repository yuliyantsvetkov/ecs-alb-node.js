FROM node:10
WORKDIR /usr/src/app
COPY infrastructure-coding-challenge/api/* ./
RUN npm install
EXPOSE 1337
CMD [ "npm", "start" ]