FROM node:17.4-alpine3.14 as builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:1.21.6-alpine
COPY --from=builder /usr/src/app/dist/proj5/ /usr/share/nginx/html