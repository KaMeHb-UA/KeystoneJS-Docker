FROM node:latest
MAINTAINER KaMeHb-UA "marlock@etlgr.com"

# Installing keystone
RUN npm install -g yo && npm install -g generator-keystone
RUN useradd -m -d /cms cms
RUN ln -s /cms /keystone-starter
RUN echo "cd / && yo keystone auto" | su - cms
RUN rm /keystone-starter
# Assigning port
EXPOSE 3000

CMD ["bash", "-c", "echo 'cd /cms && npm start' | su -p - cms"]


