# Etapa 1: Build
FROM node:20-alpine AS builder

# Instala dependências de build
RUN apk add --no-cache git python3 make g++

# Cria diretório da app
WORKDIR /app

# Copia apenas os arquivos de dependência primeiro
COPY package*.json ./

# Instala dependências (inclusive as que exigem git)
RUN npm install

# Copia o restante da aplicação
COPY . .

# Gera os arquivos de build
RUN npm run build

# Etapa 2: Produção
FROM node:20-alpine

WORKDIR /app

# Copia apenas os arquivos necessários da etapa anterior
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma  # necessário se estiver usando Prisma
COPY --from=builder /app/.env .env        # necessário se estiver usando variáveis locais

# Porta que será exposta (deve bater com o .listen(port) do seu app)
ENV PORT=8080
EXPOSE 8080

CMD ["node", "dist/index.js"]
