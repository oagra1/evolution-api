# Etapa 1: build
FROM node:20-alpine AS builder

# Instala ferramentas necessárias
RUN apk add --no-cache git python3 make g++

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos base
COPY package*.json ./
COPY tsconfig.json ./
COPY tsup.config.ts ./

# Instala dependências
RUN npm install

# Copia todos os arquivos da aplicação
COPY . .

# Gera build
RUN npm run build

# Etapa 2: imagem final
FROM node:20-alpine

WORKDIR /app

# Copia build e node_modules da etapa anterior
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# Expõe porta
EXPOSE 8080

# Comando de inicialização
CMD ["node", "dist/index.js"]
