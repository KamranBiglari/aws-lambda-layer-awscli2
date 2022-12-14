FROM public.ecr.aws/lambda/provided:latest

#
# versions
#

ARG AWSCLI_VERSION=2.9.6

USER root
RUN mkdir -p /opt
WORKDIR /tmp

#
# tools
#

RUN yum update -y \
    && yum install -y zip unzip wget tar gzip

#
# aws cli
#

RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip -o awscli-bundle.zip
RUN unzip awscli-bundle.zip
RUN ./aws/install -i /opt/awscli -b /opt/awscli/

# organize for self-contained usage
# RUN mv /opt/awscli                                    /opt/awscli.tmp
# RUN mv /opt/awscli/bin/aws                            /opt/awscli

# cleanup
RUN rm -rf /opt/awscli/v2/current/dist/awscli/examples

#
# create the bundle
#

RUN cd /opt \
    && zip -9 --symlinks -r ../layer.zip * \
    && echo "/layer.zip is ready" \
    && ls -alh /layer.zip;

WORKDIR /
ENTRYPOINT [ "/bin/bash" ]