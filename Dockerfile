FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y vim less python-is-python3 ssh sshpass
RUN apt-get install -y python3-pip libsndfile1 ffmpeg

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools 

RUN pip3 install ffmpeg && \
    pip3 install spleeter

RUN mkdir spleeter

ARG FILENAME
ARG EXT
ARG NUMSTEMS
COPY ${FILENAME}.${EXT} /spleeter
RUN rm -rf /${FILENAME}
RUN spleeter separate -p spleeter:${NUMSTEMS}stems -o ${FILENAME} /spleeter/${FILENAME}.wav

ARG USERNAME
ARG IP
ARG PASSWD
RUN sshpass -p "${PASSWD}" scp -r -oStrictHostKeyChecking=no /${FILENAME}/* ${USERNAME}@${IP}:~/spleeter-docker/outputs/

