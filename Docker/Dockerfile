FROM node:20-alpine

# Instala git e outras dependências básicas
RUN apk add --no-cache git python3 make g++ bash

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]
