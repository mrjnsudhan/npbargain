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
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html