FROM nytimes/library

COPY . ./custom/
WORKDIR /usr/src/tmp
COPY package*.json ./
RUN npm i
RUN yes | cp -rf ./node_modules/* /usr/src/app/node_modules
WORKDIR /usr/src/app
RUN npm run build
CMD [ "npm", "run", "start" ]
