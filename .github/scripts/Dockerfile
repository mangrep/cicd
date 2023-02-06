FROM alpine:3
RUN apk --no-cache add postgresql12-client
RUN apk add --no-cache bash
WORKDIR /cloudsql
RUN ls
COPY ./.github/scripts/grant-select-readonly-user.sh /scripts/grant-select-readonly-user.sh

COPY --from=gcr.io/cloudsql-docker/gce-proxy /cloud_sql_proxy /cloudsql/cloud_sql_proxy
ENTRYPOINT [ "bash" ]
