#1st stage
FROM node:20 as build

#working directory
WORKDIR /app

#copying from host to docker
COPY . .

#running both the below command by using &&
RUN npm install && npm run build

#2nd stage
FROM nginx:alpine

#coping the files from 1st to the destination point
COPY --from=build /app/dist /usr/share/nginx/html
