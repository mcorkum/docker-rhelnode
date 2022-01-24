FROM redhat/ubi8

# Install Node
RUN dnf module install nodejs:16 -y

# Install PM2 
RUN npm i -g pm2

# Create app directory
WORKDIR /opt/node-app

# Copy hello world script
COPY app.js ./

# Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:0 /opt/node-app && chmod -R ug+rwx /opt/node-app

# Ser user
USER 1001

# Set ENV
ENV NODE_ENV development
ENV PORT 3000

# Expose 3000
EXPOSE 3000

# Start up
CMD ["node", "app.js"]