FROM node:22 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


RUN npm run build


RUN ls -la /app && ls -la /app/dist  # Check both /app and /app/dist

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html  


EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]