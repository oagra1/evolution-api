# Etapa de build
FROM node:20-alpine AS builder

# Instala dependências para build de pacotes nativos
RUN apk add --no-cache git python3 make g++

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos de dependência
COPY package*.json ./

# Instala dependências com devDependencies
RUN npm install

# Copia todo o projeto
COPY . .

# Compila o projeto
RUN npm run build

# Etapa final de produção
FROM node:20-alpine

# Define diretório de trabalho
WORKDIR /app

# Copia tudo da imagem anterior (já compilado)
COPY --from=builder /app /app

# Instala apenas as dependências de produção
RUN npm install --omit=dev

# Define o comando de execução
CMD ["node", "dist/index.js"]
