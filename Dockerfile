FROM node:16-alpine

RUN corepack enable

WORKDIR /home

COPY ./package.json package.json
COPY ./tsconfig.json tsconfig.json
COPY ./.yarnrc.yml .yarnrc.yml
COPY ./.yarn .yarn
COPY ./yarn.lock yarn.lock
COPY ./src src

RUN yarn install
RUN yarn tsc

ENTRYPOINT [ "node", "dist/index.js" ]
