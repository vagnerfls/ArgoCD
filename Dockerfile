FROM golang:1.17 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLE=0 go build -o server main.go

FROM alpine:3.12
WORKDIR /app
COPY --from=build /app/server .
CMD ["./server"]
