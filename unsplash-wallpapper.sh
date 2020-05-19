#!/bin/bash

Help()
{
   # Display Help
   echo "This options is avaiable to interacte with your script."
   echo
   echo "Syntax: sh unsplash-wallpapper <username-unsplash> <resolution-image>"
   echo "options:"
   echo "h     Print this Help."
   echo
}

while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

unsplash_user=$1
resolution_wallpapper=$2

if ! [ -x "$(command -v feh)" ]; then
  echo 'Error: feh is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi

if [ "" = "$unsplash_user" ]; then
  echo 'Random Image' >&2
  wget "https://source.unsplash.com/random/${resolution_wallpapper}" -O $HOME/tmp/wallpaper.jpg
  feh --bg-scale $HOME/tmp/wallpaper.jpg > /dev/null 2>&1 &
else
  echo 'Random Image User' >&2
  wget "https://source.unsplash.com/user/${unsplash_user}/likes/${resolution_wallpapper}" -O $HOME/tmp/wallpaper.jpg
  feh --bg-scale $HOME/tmp/wallpaper.jpg > /dev/null 2>&1 &
fi
