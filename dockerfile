
FROM golang:1.20-alpine AS builder

RUN apk add --no-cache git

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o /app/desafio-multitthreading ./cmd/desafio-multitthreading

FROM alpine:3.18

RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY --from=builder /app/desafio-multitthreading /app/desafio-multitthreading

RUN addgroup -S app && adduser -S -G app app
USER app

ENTRYPOINT ["/app/desafio-multitthreading"]
