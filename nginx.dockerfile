FROM nginx

# Copy Nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf
# Copy FE dist files to serve from nginx
COPY ./frontend/frontend-app/dist /usr/share/nginx/html

# Copy FE source to parse with drill4js-cli
WORKDIR /usr/share/temp
COPY ./frontend/frontend-app ./

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh \
  && apt-get install nodejs -y \
  && node -v \
# Install dependencies
  && npm install --silent \
  && ls \
# Install angular cli
  && npm i -g @angular/cli \
# Build FE
  && ng build

EXPOSE 80

# Replace default JS-agenthost in drill4j config
CMD sed -i 's/jsagent:9404/'${JS_AGENT_HOST}'/g' drill4js.config.json \
# Parse project
  && npx drill4js-cli@${JS_AST_PARSER_VERSION} -s -c ./drill4js.config.json -b ${BUILD_VERSION} \
  && nginx -g "daemon off;"
