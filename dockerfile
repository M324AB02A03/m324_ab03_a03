FROM node:18

WORKDIR /app

COPY . .

RUN yarn install 
RUN yarn lint
RUN yarn test
RUN yarn build

CMD ["node", "build/index.js"]

