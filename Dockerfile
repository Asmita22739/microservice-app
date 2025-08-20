# Use Node.js LTS
FROM node:18-alpine

# Set workdir
WORKDIR /usr/src/app

# Copy files
COPY package*.json ./
RUN npm install --production

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
