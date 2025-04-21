FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache git

RUN git clone https://github.com/oagra1/evolution-api.git .

RUN npm install

EXPOSE 8080

CMD ["npm", "run", "start:prod"]
