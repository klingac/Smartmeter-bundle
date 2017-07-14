FROM ubuntu:trusty

MAINTAINER Martin Krutak devklingac+smartmeter@gmail.com

# main env
ENV SMARTMETER_VERSION 1.4.0
ENV SMARTMETER_FILENAME SmartMeter_${SMARTMETER_VERSION}_linux.tar.gz
ENV SMARTMETER_URL http://smartmeter-api.etnetera.cz/download/release/${SMARTMETER_VERSION}/linux/full/SmartMeter_${SMARTMETER_VERSION}_linux.tar.gz
ENV SMARTMETER_PATH /srv/app/sm-linux-light-full-${SMARTMETER_VERSION}/

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y curl && \
	mkdir -p ${SMARTMETER_PATH} && cd ${SMARTMETER_PATH} && \
	curl ${SMARTMETER_URL} | tar -xzC ${SMARTMETER_PATH} --strip-components=1 

WORKDIR ${SMARTMETER_PATH}
CMD ["./SmartMeter.sh", "runTestNonGui"]

