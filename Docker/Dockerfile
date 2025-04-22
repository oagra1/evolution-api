FROM node:20-alpine

# Instala dependências necessárias para builds, git e segurança do ambiente
RUN apk update && apk add --no-cache \
  git \
  bash \
  python3 \
  make \
  g++ \
  libc6-compat \
  ffmpeg \
  vips-dev \
  autoconf \
  automake \
  libtool \
  nasm \
  build-base

WORKDIR /app

# Copia e instala dependências com lockfile (se houver)
COPY package*.json ./

RUN npm install

# Copia o restante da aplicação
COPY . .

# Gera os arquivos de build (Tsup + TS)
RUN npm run build

# Inicia a aplicação
CMD ["npm", "start"]
