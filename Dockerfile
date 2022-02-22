# to build this docker image:
#   docker build .
# FROM gocv/opencv:4.5.4
# form my own opencv-static image
FROM registry.cn-shenzhen.aliyuncs.com/wwminger/opencv:454_static
ENV GOPATH /go

COPY . /go/src/gocv.io/x/gocv/

WORKDIR /go/src/gocv.io/x/gocv
RUN go build -tags example -o /build/gocv_version -i ./cmd/version/

# add other helpful tools
RUN go get -u github.com/posener/complete/gocomplete && gocomplete -install

CMD ["/build/gocv_version"]
