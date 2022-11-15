FROM nginx:alpine
COPY ./dist/projet-cd /usr/share/nginx/html
EXPOSE 4201
CMD ["nginx", "-g", "daemon off;"]
