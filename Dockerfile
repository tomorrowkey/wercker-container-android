FROM ubuntu:14.04
MAINTAINER Tomoki Yamashita <tomorrowkey@gmail.com>

# Upgrade software
RUN apt-get update -y && apt-get upgrade -y

# Git installation
RUN apt-get install -y git

# Open JDK8 installation
RUN \
  apt-get install -y software-properties-common curl && \
  add-apt-repository -y ppa:openjdk-r/ppa && \
  apt-get update && \
  apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Android SDK Installation
ENV ANDROID_SDK_REVISION r24.4.1
RUN \
  cd /usr/local && \
  curl -L -O "https://dl.google.com/android/android-sdk_$ANDROID_SDK_REVISION-linux.tgz" && \
  tar -xf "android-sdk_$ANDROID_SDK_REVISION-linux.tgz" && \
  rm "/usr/local/android-sdk_$ANDROID_SDK_REVISION-linux.tgz"
RUN apt-get install -y lib32z1 lib32gcc1

ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

RUN echo y | android update sdk --no-ui --force --all --filter "tools"
RUN echo y | android update sdk --no-ui --force --all --filter "platform-tools"
RUN echo y | android update sdk --no-ui --force --all --filter "build-tools-23.0.3,build-tools-23.0.2,build-tools-23.0.1"
RUN echo y | android update sdk --no-ui --force --all --filter "android-23,android-22,android-21"
RUN echo y | android update sdk --no-ui --force --all --filter "extra-android-m2repository,extra-google-google_play_services,extra-google-m2repository"

# Ruby installation
RUN add-apt-repository -y ppa:brightbox/ruby-ng && apt-get update && apt-get install -y ruby2.3
