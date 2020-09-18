FROM node:12.18.1-alpine

# git is now required when install firebase-tools
RUN apk update && apk upgrade && apk add --no-cache git && apk install scp

RUN npm install -g firebase-tools

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
