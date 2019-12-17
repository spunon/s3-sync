FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add python py-pip groff && \
    pip install awscli

ENV AWS_ACCESS_KEY_ID=someAccessKeyID
ENV AWS_SECRET_ACCESS_KEY=someSecretAccessKey
ENV AWS_DEFAULT_REGION=us-west-2
ENV LOCAL_DIRECTORY=/local-s3-files
ENV REMOTE_S3_ENDPOINT=s3://my-bucket/path
ENV S3_SYNC_OPTIONS=


CMD ["/bin/sh", "-c", "while true; do date; echo \"Syncing ${LOCAL_DIRECTORY} to ${REMOTE_S3_ENDPOINT}...\"; aws s3 sync ${LOCAL_DIRECTORY} ${REMOTE_S3_ENDPOINT} ${S3_SYNC_OPTIONS}; sleep 5; done"]
