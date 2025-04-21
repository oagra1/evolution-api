FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache git

COPY . .

RUN npm install

RUN npx prisma generate

RUN npm run build

EXPOSE 8080

CMD ["npm", "run", "start:prod"]
