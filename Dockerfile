# Etapa 1: build
FROM node:20-alpine AS builder

# Instala ferramentas necessárias
RUN apk add --no-cache git python3 make g++

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos necessários para instalar dependências
COPY package*.json ./
COPY tsconfig.json ./
COPY tsup.config.ts ./

# Instala dependências
RUN npm install

# Copia o restante do código-fonte
COPY . .

# Realiza o build (typescript + tsup com paths)
RUN npm run build

# Etapa 2: imagem final para produção
FROM node:20-alpine

# Define diretório da aplicação
WORKDIR /app

# Copia arquivos do build da etapa anterior
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# Exponha a porta usada pela aplicação
EXPOSE 8080

# Inicia a aplicação
CMD ["node", "dist/index.js"]
