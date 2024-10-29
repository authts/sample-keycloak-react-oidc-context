FROM node:22-bookworm
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
CMD [ "npm", "run", "dev" ]
