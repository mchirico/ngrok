FROM golang:alpine AS build

RUN apk add --no-cache git


WORKDIR /go/src/project

# Copy the entire project and build it
# This layer is rebuilt when a file changes in the project directory
COPY . /go/src/project/
RUN go get -v -t -d ./...
RUN go build -o /bin/project

# This results in a single layer image
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /bin/project /bin/project
COPY --from=build /go/src/project/id_rsa /etc/id_rsa
COPY --from=build /go/src/project/authorized_keys /etc/authorized_keys

ENTRYPOINT ["/bin/project"]
# CMD ["--help"]
