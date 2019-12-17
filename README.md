# s3-sync

*Check it out on dockerhub!*
https://hub.docker.com/r/spunon/s3-sync

This is a simple container that loops and syncs a local folder to an s3 bucket. Start this container with files already in your local directory, remote directory, or add them after the containers starts running. Stop the container at any time, and pick up where you left off by starting the container again.

## Usage:

Fill in your own variables below, and include any options aws s3 sync options in the var S3_SYNC_OPTIONS. (This variable should be a space separated list of the option flags referenced in this documentation: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html e.g S3_SYNC_OPTIONS="--delete --other-option" )

```
docker run -d \
    --name="s3-sync" \
    -e AWS_ACCESS_KEY_ID="YOURACCESSKEY" \
    -e AWS_SECRET_ACCESS_KEY="YOURSECRETKEY" \
    -e AWS_DEFAULT_REGION="us-west-2" \
    -e LOCAL_DIRECTORY="/local-s3-files" \
    -e REMOTE_S3_ENDPOINT="s3://your-s3-bucket/" \
    -e S3_SYNC_OPTIONS="" \
    -v /Users/yourname/yourdir:/local-s3-files \
    spunon/s3-sync
```

## Log your running container to see what's being synced*

```
docker logs -f s3-sync
```