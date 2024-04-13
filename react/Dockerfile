FROM node:20.12-bookworm
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "dev" ]
