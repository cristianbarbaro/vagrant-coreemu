#!/usr/bin/env bash


# split installation into two parts
#  - part 1 - build VM and do initial provisioning; because PATH isn't immediately
#             available, a logout is required and installation continues in part 2
#  - part 2 - complete the remaining installation

# part 1 install
vagrant up

# part 2 install
vagrant ssh -c \
    "cd shared/core-release-8.0.0; \
    inv install; \
    sudo systemctl enable core-daemon; \
    sudo systemctl start core-daemon"
