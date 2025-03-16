ARG BASE_IMAGE=library/openjdk:11

FROM docker.io/library/gradle:8-jdk11 AS build

ARG APP_REPO=https://github.com/KotatsuApp/kotatsu-syncserver
ARG APP_TAG=master

WORKDIR /home/gradle/src
RUN <<-EOT sh
	set -eu

	wget ${APP_REPO}/archive/refs/heads/${APP_TAG}.tar.gz -O - \
		| tar -xzv --strip-components=1

	chown -R gradle:gradle .
	gradle shadowJar --no-daemon
EOT

FROM docker.io/${BASE_IMAGE}
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/*-all.jar /app/kotatsu-syncserver.jar

EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/app/kotatsu-syncserver.jar"]
