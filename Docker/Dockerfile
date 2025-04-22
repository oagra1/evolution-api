# Etapa de build
FROM node:20-alpine AS builder

# Instala dependências necessárias para compilar pacotes nativos e resolver erro ENOENT (git)
RUN apk add --no-cache git python3 make g++

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependência
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante da aplicação
COPY . .

# Compila o projeto TypeScript
RUN npm run build

# Etapa final
FROM node:20-alpine

# Cria diretório
WORKDIR /app

# Copia apenas o resultado do build
COPY --from=builder /app /app

# Define variável de ambiente (opcional)
ENV NODE_ENV=production

# Expõe a porta
EXPOSE 8080

# Comando final
CMD ["node", "dist/index.js"]
