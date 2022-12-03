FROM node:18.12.1
ARG pm2_secret_key	
ENV LAST_UPDATED 20160605T165400
ENV PM2_PUBLIC_KEY lhnfp4n5qgpi7gq
ENV PM2_SECRET_KEY=$pm2_secret_key
ENV HOSTNAME=0
LABEL description="webaverse-app"

# Copy source code
COPY . /app
	
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh && chmod +x /usr/local/bin/docker-entrypoint.sh

# Change working directory
WORKDIR /app


# Install dependencies
RUN apt update -y
RUN npm install -g pm2@latest
RUN npm install
#RUN date +%s%3N | export HOSTNAME=standin
#RUN pm2 link $PM2_SECRET_KEY $PM2_PUBLIC_KEY $HOSTNAME
RUN  apt-get install -y apt-transport-https \
		xvfb \
		libxcursor1 \
		libgtk-3-dev \
		libxss1 \
		libasound2 \
		libnspr4 \
		libnss3 \
		libx11-xcb1


# Expose API port to the outside
EXPOSE 3000
EXPOSE 3001


# Launch application
CMD ["docker-entrypoint.sh"]
# CMD npm run start-pm2 && npm run setup:test && npm test
