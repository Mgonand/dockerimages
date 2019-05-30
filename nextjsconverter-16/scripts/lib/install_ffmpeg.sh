#!/bin/bash
set -e
apt-get install software-properties-common -y
add-apt-repository ppa:jonathonf/ffmpeg-4 -y
apt-get update -y
apt-get install ffmpeg -y
