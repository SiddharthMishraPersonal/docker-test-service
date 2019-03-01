FROM node:11.9.0-alpine

# Add vim for editing purpose
RUN apk update
RUN apk add vim

# Copy source to container
RUN mkdir -p /usr/app/src

# Copy source code
COPY src /usr/app/src
COPY package.json /usr/app
COPY package-lock.json /usr/app

WORKDIR /usr/app

# Install packages to match current OS.
RUN npm install -only=production


# Create a user group 'microsoftgroup'
RUN addgroup -S microsoftgroup

# Create a user 'appuser' under 'microsoftgroup'
RUN adduser -S -D -h /usr/app/src appuser microsoftgroup

# Chown all the files to the app user.
RUN chown -R appuser:microsoftgroup /usr/app

# Switch to 'appuser'
USER appuser

# Open the mapped port
EXPOSE 3000

# Start the process
CMD ["npm", "start"]
