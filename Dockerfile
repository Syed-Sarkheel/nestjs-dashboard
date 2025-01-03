# Step 1: Use the official Node.js image as the base image
FROM node:16-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (or yarn.lock) for installing dependencies
COPY package*.json ./

# Step 4: Install the dependencies
RUN npm install --production

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Build the Next.js app
RUN npm run build

# Step 7: Expose the port the app will run on
EXPOSE 3000

# Step 8: Start the app
CMD ["npm", "start"]
