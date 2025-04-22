# Etapa 1: build
FROM node:20-alpine AS builder

# Instala ferramentas necessárias
RUN apk add --no-cache git python3 make g++

# Define diretório de trabalho
WORKDIR /app

# Copia apenas o necessário para instalar dependências
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia o restante dos arquivos
COPY . .

# Gera os arquivos de build
RUN npm run build

# Etapa 2: imagem final para produção
FROM node:20-alpine

# Cria diretório
WORKDIR /app

# Copia apenas os arquivos compilados da etapa anterior
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# Expõe a porta (ajuste se necessário)
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["node", "dist/index.js"]
