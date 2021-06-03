FROM ubuntu:20.04

# BASED ON: https://github.com/MashMB/nvim-ide/blob/master/nvim/Dockerfile

# Set environment variables.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
# Rust
ENV RUST_TOOLCHAIN=nightly
ENV RUSTUP_URL https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
ENV RUSTUP_ADDITIONAL_ARGS --target x86_64-pc-windows-gnu

# Expose some ports to host by default.
EXPOSE 22 8080 8081 8082 8083 8084 8085

# Create user, remove user password, add user to sudo group, add sudo group to sudoers, create user home directory.
RUN useradd user && passwd -d user && usermod -aG sudo user \
    # && echo '%sudo ALL=(ALL) ALL' >> /etc/sudoers \
    && mkdir /home/user && chown user:user /home/user

# Update packages & upgrade them.
RUN apt-get update \
    && apt-get -y upgrade

# Enable universe repository.
RUN apt -y install software-properties-common \
    && add-apt-repository universe

# Install some general packages and generic neovim dependencies.
RUN apt-get -y install build-essential git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip fzf wget ripgrep git tig xclip openssh-server python3 nodejs npm python3-pip mingw-w64

RUN apt-get -y install sudo

# Set user.
USER user

# Compile and install neovim.
RUN git clone https://github.com/neovim/neovim ~/neovim \
    && cd ~/neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo -s \
    && sudo make install \
    && cd ~ && rm -rf ~/neovim

# Compile and install universal ctags.
RUN git clone https://github.com/universal-ctags/ctags ~/ctags \
    && cd ~/ctags \
    && ./autogen.sh && ./configure \
    && make -s \
    && sudo make install \
    && cd ~ && rm -rf ~/ctags

# Install Rust using rustup.
RUN cd ~ && wget ${RUSTUP_URL} && sudo chmod +x rustup-init \
    && ./rustup-init -y --no-modify-path --component rust-src --default-toolchain ${RUST_TOOLCHAIN} --default-host x86_64-unknown-linux-gnu ${RUSTUP_ADDITIONAL_ARGS} \
    && rm rustup-init \
    && . $HOME/.cargo/env \
    && rustup --version && cargo --version && rustc --version

# Cooperate Neovim with Python 3.
RUN pip3 install pynvim neovim-remote

# Cooperate NodeJS with Neovim.
RUN sudo npm i -g --force neovim tree-sitter-cli

# Install Packer.
RUN git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Create directory for Neovim configuration files.
RUN mkdir -p ~/.config/nvim

# Create directory for projects (there should be mounted from host).
RUN mkdir -p ~/workspace

# Set default location after container startup.
WORKDIR /home/user/workspace

# Clean unneeded leftovers (older versions of packages).
RUN sudo apt-get -y clean

# Copy home files (passed by host).
# Run init script.
CMD cp -R -p /userhome/* ~/ \
    && sudo chmod +x ~/init.sh \
    && ~/init.sh