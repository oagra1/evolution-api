FROM node:18

WORKDIR /app

COPY . .

RUN npm install -g prisma
RUN npm install

RUN npx prisma generate

EXPOSE 8080

CMD ["npm", "run", "start"]
