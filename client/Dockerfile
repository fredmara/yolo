# Use an official Node runtime as a parent image
FROM node:23-slim AS build


# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

RUN npm run build

FROM alpine:3.21.3


WORKDIR /app

RUN apk update && apk add npm

COPY --from=build /usr/src/app /app

ENV HOST=0.0.0.0


# Expose the port the app runs on
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "start"]

CMD ["npx", "serve", "-s", "build"]