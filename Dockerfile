FROM nytimes/library

# install custom files
COPY . ./custom/

# historical. I don't think these are being used in deployment. Env vars in
# ECS are set through the console.
COPY .env /usr/src/app
COPY auth.json /usr/src/app

# install custom npm packages
WORKDIR /usr/src/tmp
COPY package*.json ./
RUN npm i
RUN yes | cp -rf ./node_modules/* /usr/src/app/node_modules

# return to app and build
WORKDIR /usr/src/app
RUN npm run build

# start app
CMD [ "npm", "run", "start" ]
