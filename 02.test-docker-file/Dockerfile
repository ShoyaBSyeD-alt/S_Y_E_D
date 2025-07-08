#base image
FROM node:20-slim

#working directory
WORKDIR /app

#copying dependencies package.json
COPY package*.json ./

#Dependencies install
RUN npm install

#copying all the current files into container
COPY . .

#Port documentation
EXPOSE 2000

#Environmente variable
ENV NODE_ENV=production

#running the code
#CMD ["node","index.js"]

