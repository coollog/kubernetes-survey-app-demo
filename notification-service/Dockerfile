FROM node:10-alpine
CMD ["nodemon","--legacy-watch", "server.js"]
COPY package*.json ./
RUN npm install
COPY *.js .
