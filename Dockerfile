FROM node:lts-alpine

RUN yarn global add better-crowdin

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
