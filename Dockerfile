FROM mhart/alpine-node:4.4.5

# Copy list of dependencies
COPY package.json /tmp/package.json

# Install dependencies
RUN cd /tmp && npm install

# Copy dependencies libraries
RUN mkdir /app && cp -a /tmp/node_modules /app/

# Change working directory
WORKDIR /app

# Copy source code
COPY . /app

# Expose API port to the outside
EXPOSE 80

# Launch application
CMD ["npm","start"]
