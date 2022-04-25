# build phase:
FROM node:16-alpine as BUILDER
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- where all the build will be stored


# run phase:
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

