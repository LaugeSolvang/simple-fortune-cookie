FROM golang:1.21 as builder
WORKDIR /app
COPY . .
RUN go mod download && go mod verify
RUN go build -o frontend .

# final stage
FROM alpine
WORKDIR /app
COPY --from=builder /app/goapp /app/
ENTRYPOINT ./goapp