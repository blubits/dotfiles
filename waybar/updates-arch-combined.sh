#!/bin/sh

sleep 3

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates_aur=$(rua upgrade --printonly | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -eq 1]; then
    echo -e "$updates update\\n$updates_arch from repositories, $updates_aur from AUR\\nupdates-arch"
elif [ "$updates" -gt 0 ]; then
    echo -e "$updates updates\\n$updates_arch from repositories, $updates_aur from AUR\\nupdates-arch"
else
    echo ""
fi
