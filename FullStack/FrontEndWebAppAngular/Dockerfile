FROM node:18

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4500

CMD ["npm", "start", "--", "--host", "0.0.0.0", "--port", "4500"]
