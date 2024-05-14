FROM nginx:alpine
RUN apk update
RUN apk add --update git nano nodejs npm
RUN git clone https://github.com/utxo-one/notepress /app
WORKDIR /app
RUN npm install
RUN npx tailwindcss -i style/input.css -o style/output.css
ARG NPUB
ENV NPUB $NPUB
ARG HEXKEY
ENV HEXKEY $HEXKEY
ARG RELAYS
ENV RELAYS $RELAYS
ARG EXCLUDENOTES
ENV EXCLUDENOTES $EXCLUDENOTES
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
