FROM node:10-alpine
CMD ["node", "server.js"]
COPY package*.json ./
RUN npm install
COPY *.js .
