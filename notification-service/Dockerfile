FROM gcr.io/k8s-skaffold/nodemon
CMD ["nodemon","--legacy-watch", "server.js"]
COPY package*.json ./
RUN npm install
COPY *.js .
