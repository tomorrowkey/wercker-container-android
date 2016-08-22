wercker-container-android
==================

This is a docker image to build Android app on Wercker CI.

# OS
Ubuntu 14.04

# Installed packages

- Git
- OpenJDK 8
- Android SDK r24.4.1
- Ruby 2.3

## Supported gem packages

Following gems are not installed, but it works if you installed.

- fastlane

# Development
Build and run docker image on your environment with following commands

## Build
```bash
docker build -t tomorrowkey/wercker-container-android .
```

## Run
```bash
docker run -it tomorrowkey/wercker-container-android
```
