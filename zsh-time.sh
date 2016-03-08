#!/bin/sh
echo '===== /usr/bin/time zsh    -c exit ====='
/usr/bin/time zsh    -c exit

echo '===== /usr/bin/time zsh -l -c exit ====='
/usr/bin/time zsh -l -c exit

echo '===== /usr/bin/time zsh -i -c exit ====='
/usr/bin/time zsh -i -c exit
