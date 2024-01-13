FROM node:alpine
WORKDIR /src
COPY src/package.json .
RUN npm install
COPY src .
CMD ["node", "server.js"]