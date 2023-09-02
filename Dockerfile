FROM ubuntu

WORKDIR /workspace

COPY bin .

RUN apt update \
    && apt install -yq gnucobol

# 'main' seems to be reserved word
# rename to 'hello'
RUN mv main.cob hello.cob

RUN cobc -x -frelax-syntax -free hello.cob

CMD ["./hello"]