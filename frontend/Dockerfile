FROM golang:1.18 
WORKDIR /app
COPY go.mod .
COPY main.go .
COPY util.go .
RUN go mod download && go mod verify
COPY . .
RUN go build -o frontend .

CMD ["./frontend"]
