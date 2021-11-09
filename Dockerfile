# Build Steps
FROM registry.access.redhat.com/ubi8/nodejs-12 as build-step

USER 0 

RUN mkdir /app

RUN chown -R 1001:0 /app 

USER 1001

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build

# Run Steps
# FROM registry.access.redhat.com/ubi8/nginx-118
FROM nginx:1.19.8-alpine
COPY --from=build-step /app/build /usr/share/nginx/html