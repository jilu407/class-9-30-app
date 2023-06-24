FROM node AS build 
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage2
FROM nginx
COPY --from=build /app/dist/class-9-30/ /usr/share/nginx/html/
