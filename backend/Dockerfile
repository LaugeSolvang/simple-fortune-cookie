FROM golang:1.21
WORKDIR /app
COPY . /app
RUN go mod download && go mod verify
RUN cd /app && go build -o goapp

ENTRYPOINT ./goapp