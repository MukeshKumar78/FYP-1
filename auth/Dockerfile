FROM node:19-alpine
WORKDIR /usr/src/app
RUN mkdir dist

COPY package.json ./
RUN npm install
COPY dist ./dist

EXPOSE 8000
CMD ["npm", "start"]