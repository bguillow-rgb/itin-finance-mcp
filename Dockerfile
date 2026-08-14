# Used by MCP directories (Glama) to run the server for introspection checks.
# The server is zero-config: data is live-fetched from the sites' public /api
# endpoints; telemetry uses a baked publishable (write-only) key.
FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json tsconfig.json ./
COPY src ./src
RUN npm ci && npm run build && npm prune --omit=dev
ENTRYPOINT ["node", "dist/index.js"]
