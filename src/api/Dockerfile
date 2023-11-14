FROM node:16.20.1-alpine AS build

WORKDIR /app

COPY . .

RUN npm ci
RUN npm run build

CMD ["npm","run","start"]
