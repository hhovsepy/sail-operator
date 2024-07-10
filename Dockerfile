FROM registry.access.redhat.com/ubi9/ubi-minimal:latest 

ARG TARGETOS TARGETARCH

ADD out/${TARGETOS:-linux}_${TARGETARCH:-amd64}/manager /manager
ADD resources /var/lib/sail-operator/resources

USER 65532:65532
WORKDIR /
ENTRYPOINT ["/manager"]
