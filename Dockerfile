FROM archlinux/base:latest
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -S base sudo
RUN pacman --noconfirm -S python3
# Needed packages
RUN pacman --noconfirm -S jdk8-openjdk kotlin vala ocaml gcc mono rust go nodejs nasm arm-none-eabi-gcc arm-none-eabi-newlib qemu-arch-extra octave perl r dart julia haxe
# typescript from npm
RUN pacman --noconfirm -S npm
RUN npm install -g typescript
# Links for ARM assembly
RUN ln -s /usr/bin/arm-none-eabi-as /usr/bin/arm-linux-gnu-as && ln -s /usr/bin/arm-none-eabi-ld /usr/bin/arm-linux-gnu-ld

RUN mkdir -p /tmp/ex
COPY . /tmp/ex
RUN cd /tmp/ex && ./install && \
  echo '>>> RUNNING TEST' && ./runtest -nw && \
  cd && rm -rf /tmp/ex

CMD bash
