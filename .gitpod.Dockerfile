FROM gitpod/workspace-base:latest

RUN mkdir -p /home/gitpod/.local/bin && \
    curl -Lo /tmp/typst-x86_64-unknown-linux-musl.tar.xz https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz && \
    tar -xJf /tmp/typst-x86_64-unknown-linux-musl.tar.xz --strip-components=1 -C /home/gitpod/.local/bin && \
    rm /tmp/typst-x86_64-unknown-linux-musl.tar.xz

RUN mkdir -p /home/gitpod/.local/share/fonts && \
    curl -Lo /tmp/HaranoAjiFonts-master.tar.gz https://github.com/trueroad/HaranoAjiFonts/archive/master.tar.gz && \
    tar -xzf /tmp/HaranoAjiFonts-master.tar.gz --strip-components=1 -C /home/gitpod/.local/share/fonts && \
    rm /tmp/HaranoAjiFonts-master.tar.gz