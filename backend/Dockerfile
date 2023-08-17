FROM golang:1.21 as build
WORKDIR /app
COPY . .
RUN go mod download && go mod verify
RUN CGO_ENABLED=0 go build -o ./goapp -a -ldflags '-extldflags "-static"' . 

FROM scratch
WORKDIR /
COPY --from=build app/goapp /
ENTRYPOINT ["./goapp"]