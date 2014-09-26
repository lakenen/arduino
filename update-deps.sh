#!/bin/bash

update_repo() {
  local dirname="$1"
  local repo="$2"
  if [ -d "$dirname" ];
    then cd $dirname && git pull && cd ..;
    else git clone "git@github.com:${repo}.git" $dirname;
  fi
}

# HARDWARE
echo "Installing hardware..."
mkdir -p hardware && cd hardware
# https://github.com/damellis/attiny
update_repo "attiny" "damellis/attiny"
# The attiny repo contains the stuff in a second attiny subdir
# TODO: figure out a better way to get the correct attiny subdir
[ -f attiny85 ] || ln -s attiny/attiny attiny85

cd ..

# LIBRARIES
echo "Installing libraries..."
mkdir -p libraries && cd libraries
# https://github.com/milesburton/Arduino-Temperature-Control-Library
update_repo "DallasTemperature" "milesburton/Arduino-Temperature-Control-Library"

# https://github.com/ppicazo/OneWire
update_repo "OneWire" "ppicazo/OneWire"

# https://github.com/maniacbug/RF24
update_repo "RF24" "maniacbug/RF24"

cd ..
