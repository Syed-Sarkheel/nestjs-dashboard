# Step 1: Use the official Node.js image (version 18) as the base image
FROM node:18-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (or yarn.lock) for installing dependencies
COPY package*.json ./

# Step 4: Install the dependencies (use the --frozen-lockfile flag to ensure no changes to package-lock.json)
RUN npm install --production --legacy-peer-deps

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Build the Next.js app
RUN npm run build

# Step 7: Expose the port the app will run on
EXPOSE 3000

# Step 8: Start the app in production mode
CMD ["npm", "run", "start"]
