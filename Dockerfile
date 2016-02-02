# version 0.1.0
FROM ubuntu:14.04

# hack to set uid/gid to the same as host user
ARG GROUP_ID=1000
ARG USER_ID=1000
RUN groupadd -g $GROUP_ID user && \
	adduser --disabled-password --gecos '' --uid=$USER_ID --gid=$GROUP_ID user && \
	adduser user sudo && \
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

RUN sudo apt-get -q update
