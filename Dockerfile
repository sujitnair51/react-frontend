# Build Steps
FROM registry.access.redhat.com/ubi8/nodejs-12 as build-step

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build

# Run Steps
FROM registry.access.redhat.com/ubi8/nginx-118
COPY --from=build-step /app/build /usr/share/nginx/html