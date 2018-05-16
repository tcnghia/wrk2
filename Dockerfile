FROM ubuntu

RUN apt update
RUN apt install -y build-essential libssl-dev git
RUN git clone https://github.com/tcnghia/wrk2.git
RUN cd wrk2 ; make

ENTRYPOINT ["/wrk2/wrk"]
