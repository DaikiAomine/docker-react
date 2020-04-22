FROM node:alpine as build

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]


FROM nginx
COPY --from=build /app/build /usr/share/nginx/html

#docker run -p 8080:80 c33d950e7c18 for using nginx production server