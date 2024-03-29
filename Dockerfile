FROM node:16
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./
COPY ./yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g
RUN yarn install --platform=linuxmusl
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD ["yarn", "start"]
