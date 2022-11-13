FROM node:19-alpine
WORKDIR /usr/src/app
RUN mkdir dist

COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

EXPOSE 8000
CMD ["npm", "start"]