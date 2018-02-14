FROM node:latest
MAINTAINER KaMeHb-UA "marlock@etlgr.com"

# Installing keystone
RUN npm install -g yo && npm install -g generator-keystone
RUN useradd -m -d /cms cms
RUN ln -s /cms /keystone-starter
RUN echo "cd / && yo keystone auto" | su - cms
RUN rm /keystone-starter
# Removing demo launch file
RUN rm /cms/keystone.js
# Getting fresh demo launch file
RUN wget https://raw.githubusercontent.com/KaMeHb-UA/KeystoneJS-Docker/master/cms/keystone.js -o /cms/keystone.js
# Assigning port
EXPOSE 3000

CMD ["bash", "-c", "echo 'cd /cms && node keystone' | su - cms"]


