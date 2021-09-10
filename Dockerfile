## This Dockerfile for production server

# First block
FROM node:apline as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second block
FROM nginx
#for elasticbeanstalk
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
