# Etapa 1 - Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copia o package.json e instala apenas as dependências
COPY package*.json ./
RUN npm install

# Copia o restante do código
COPY . .

# Compila o projeto com tsup
RUN npx tsup

# Etapa 2 - Runtime
FROM node:20-alpine

WORKDIR /app

# Copia apenas o resultado do build e as deps necessárias
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY package*.json ./

# Porta usada no EasyPanel
ENV PORT=8080

EXPOSE 8080

CMD ["node", "dist/main.js"]
