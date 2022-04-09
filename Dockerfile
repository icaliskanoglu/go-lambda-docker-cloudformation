FROM public.ecr.aws/lambda/provided:al2-arm64 as builder
# install compiler
RUN yum install -y golang
RUN go env -w GOPROXY=direct
# cache dependencies
ADD go.mod go.sum ./
RUN go mod download
# build
ADD . .
RUN go build -mod=vendor -o /tmp/lambda cmd/lambda.go
# copy artifacts to a clean image
FROM public.ecr.aws/lambda/provided:al2-arm64
COPY --from=builder /tmp/lambda /lambda

ENTRYPOINT [ "/lambda" ]
