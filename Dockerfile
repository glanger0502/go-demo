#阶段1
FROM golang:1.19-alpine AS build
ARG GOPROXY=https://goproxy.cn,direct

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY app.go ./
RUN go build -ldflags="-s -w" -o /docker-go-demo

#阶段2
FROM alpine
WORKDIR /
COPY --from=build /docker-go-demo /docker-go-demo

EXPOSE 8081

CMD ["./docker-go-demo"]

