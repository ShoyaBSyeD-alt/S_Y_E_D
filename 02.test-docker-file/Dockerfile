#base image
iFROM node:20-slim

#working directory
WORKDIR /app

#copying dependencies package.json
COPY package*.json ./

#Dependencies install
RUN npm install

#copying all the current files into container
COPY . .

#Port documentation
EXPOSE 8347

#Environmente variable
ENV NODE_ENV=production

#running the code
#CMD ["node","index.js"]

