#!/bin/bash
i3-msg "workspace 6; append_layout ~/.i3/workspace-6.json;"

(urxvt -e htop &)
(urxvt -e tty-clock -c -D -C 7  &)
