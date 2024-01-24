FROM alpine:3.19
WORKDIR /

RUN apk --update add bash protoc protobuf-dev && rm -rf /var/cache/apk/*

COPY LICENSE.md README.md script/entrypoint.sh ./
COPY bin/protoc-gen-doc /usr/bin/

VOLUME ["/out"]
VOLUME ["/protos"]

ENTRYPOINT ["./entrypoint.sh"]
CMD ["--doc_opt=html,index.html"]
