wercker-container-android
==================

This is a docker image to build Android app on Wercker CI.
The docker image is hosted at https://hub.docker.com/r/tomorrowkey/wercker-container-android/

# Usage
Just write this docker image in your wercker.yml at box section.

```yaml
box: tomorrowkey/wercker-container-android

build:
    steps:
        - script:
            name: run gradle
            code: |
                ./gradlew --full-stacktrace -q --project-cache-dir=$WERCKER_CACHE_DIR clean build
```

# Development
Build and run docker image on your environment

## Build
```bash
docker build -t tomorrowkey/wercker-container-android .
```

## Run
```bash
docker run -it tomorrowkey/wercker-container-android
```
