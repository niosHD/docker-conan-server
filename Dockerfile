FROM python:alpine
MAINTAINER Mario Werner <mario.werner@iaik.tugraz.at>

# Install dependencies so they get cached with the image
VOLUME /var/lib/conan
RUN apk add --no-cache --virtual .build-deps  \
        gcc \
        libc-dev && \
    pip install --no-cache-dir conan && \
    apk del .build-deps && \
    adduser -S conan -h /var/lib/conan -s /bin/sh

# Run uwsgi listening on port 9300
EXPOSE 9300

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/sh", "/entrypoint.sh"]
