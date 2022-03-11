# BUILD PHASE --
# we have added 'as builder'
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

# just build here ...
#CMD ["npm", "run", "build"]
RUN npm run build

# RUN PHASE --
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html