# VueJS App
FROM node:16-alpine as vue-app
WORKDIR /usr/src/app
COPY package.json ./
COPY . ./
RUN npm install
RUN npm run build

# production environment
FROM nginx:alpine
COPY --from=vue-app /usr/src/app/dist /usr/share/nginx/html/
COPY server/default.conf /etc/nginx/conf.d/default.conf