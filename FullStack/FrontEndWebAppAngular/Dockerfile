FROM node:18

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY package.json .
RUN npm install -g @angular/cli@15.0.4

COPY . /usr/src/app/
RUN npm run build
CMD ng serve --host 0.0.0.0 --port 4500 && npm start





