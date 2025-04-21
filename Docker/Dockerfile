FROM node:18-alpine

# Cria o diretório da aplicação
WORKDIR /app

# Instala git e dependências básicas
RUN apk add --no-cache git

# Clona o repositório direto dentro do container (opcional)
# RUN git clone https://github.com/EvolutionAPI/evolution.git .

# Copia todos os arquivos da pasta atual para dentro do container
COPY . .

# Instala dependências
RUN npm install

# Compila (se necessário — se usar TypeScript)
RUN npm run build

# Exponha a porta padrão
EXPOSE 8080

# Executa o servidor
CMD ["npm", "run", "start:prod"]
