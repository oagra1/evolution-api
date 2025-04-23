# Etapa 1: build
FROM node:20-alpine AS builder

RUN apk add --no-cache git python3 make g++

WORKDIR /app

COPY package*.json ./
COPY tsconfig.json ./
COPY tsup.config.ts ./

RUN npm install

COPY . .

RUN npm run build

# Etapa 2: imagem final
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

EXPOSE 8080

CMD ["node", "dist/index.js"]
