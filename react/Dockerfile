FROM oven/bun:1-debian
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
CMD [ "bun", "run", "dev" ]
