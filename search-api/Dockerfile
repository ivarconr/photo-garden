FROM node:9.3-alpine

WORKDIR /usr/src/app

ADD package.json .
RUN yarn install --prod

ADD . .

ENTRYPOINT ["node", "app.js"]
