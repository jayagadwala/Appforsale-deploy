
FROM node:20

WORKDIR /app

COPY package.json ./

RUN npm install --legacy-peer-deps

# Install Expo + ngrok globally (IMPORTANT FIX)
RUN npm install -g expo-cli
RUN npx expo install @expo/ngrok --yes || true

COPY . .

ENV CI=true

EXPOSE 3000

CMD ["npx", "expo", "start", "--lan"]
