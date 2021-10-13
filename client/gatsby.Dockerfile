# FROM node:14-alpine as builder
# # Get the necessary build tools
# RUN apk update && apk add build-base autoconf automake libtool pkgconfig nasm


# # RUN apt update && apt upgrade -y && \
# #     apt install gcc g++ make python git libc6-dev build-essential libpng-dev \
# #     libjpeg-dev libvips-dev libvips musl-dev node-gyp pngquant webp -y

# # Add the package.json file and build the node_modules folder
# WORKDIR /usr/src/app
# COPY ./package*.json ./
# RUN mkdir node_modules && npm install

# # Get a clean image with gatsby-cli and the pre-built node modules
# FROM node:14-alpine
# RUN npm install --global gatsby-cli && gatsby telemetry --disable && mkdir /save
# COPY --from=builder /usr/src/app/node_modules /save/node_modules


FROM node:latest

# EXPOSE 8000

WORKDIR /usr/src/app

# RUN npm install -g gatsby-cli
RUN npm install --global gatsby-cli && gatsby telemetry --disable

COPY package*.json /usr/src/app/
# COPY entrypoint.sh /usr/src/app/

RUN npm install
# RUN gatsby telemetry --disable
# RUN yarn install && yarn cache clean




# FROM node:14-alpine
# ENV NODE_ENV=development
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# # Installs nodemon
# # RUN npm install -g nodemon
# # RUN npm install -g typescript
# # RUN npm install -g ts-node

# # COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# COPY package*.json /usr/src/app
# # RUN npm install --production --silent && mv node_modules ../
# # RUN npm install -g create-react-app
# RUN npm install

# RUN npm install -g gatsby-cli
# RUN gatsby telemetry --disable
# # RUN npm install -g react-scripts
# # COPY . .
# EXPOSE 8000

# # CMD ["node", "app.js"]


# # base image
# FROM node:latest
# # set working directory
# RUN mkdir /client
# WORKDIR /client

# # # add `/app/node_modules/.bin` to $PATH
# # ENV PATH /app/node_modules/.bin:$PATH

# # install and cache app dependencies using yarn
# ADD package.json yarn.lock /client/
# # RUN yarn --pure-lockfile

# RUN yarn install --production=false && yarn cache clean

# # Copy all frontend stuff to new "app" folder
# COPY . /client/

# # CMD ["./run.sh"]

# EXPOSE 8000