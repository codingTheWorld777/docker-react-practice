FROM node:16-alpine as builder

WORKDIR '/app/front'

COPY front/package.json .
RUN npm install
COPY front .
RUN npm run build

# /app/front/build <-- all stuffs we care about
FROM nginx
COPY --from=builder /app/front/build /usr/share/nginx/html