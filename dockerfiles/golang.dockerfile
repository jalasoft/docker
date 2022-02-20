FROM golang:1.17.5

RUN git clone https://github.com/go-delve/delve && \
    cd delve && \
    go install github.com/go-delve/delve/cmd/dlv && \
    cd / && \
    rm -rf /delve

