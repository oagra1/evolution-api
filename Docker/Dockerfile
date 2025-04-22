# Etapa de build
FROM node:20-alpine AS builder

# Instala dependências essenciais, incluindo git e python para alguns builds nativos
RUN apk add --no-cache git python3 make g++

WORKDIR /app

# Copia package.json e package-lock.json (ou yarn.lock) para instalar dependências
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia o restante do código para o container
COPY . .

# Compila o projeto (se necessário)
RUN npm run build

# Etapa de produção
FROM node:20-alpine

# Instala apenas o necessário para rodar
RUN apk add --no-cache dumb-init

WORKDIR /app

# Copia os arquivos compilados da etapa de build
COPY --from=builder /app /app

# Porta padrão da aplicação
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["dumb-init", "node", "dist/index.js"]
