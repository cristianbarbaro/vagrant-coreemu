#!/bin/bash

tee -a /root/.bashrc <<EOF
export TERM=xterm-256color
colours=(31 32 33 34 35 36 37 41 42 43 44 45 46)
RANDOM=\$\$\$(date +%s)
c=\${colours[ \$RANDOM % \${#colours[@]} ]}
PS1='\${debian_chroot:\+(\$debian_chroot)}\[\033[01;\${c}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF