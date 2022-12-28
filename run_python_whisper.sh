#!/bin/sh


if [ ! -f audio.mp3 ]; then
    wget https://adn.podigee.com/adswizz/media/podcast_1652_was_jetzt_episode_818856_update_ein_notstand_aber_keine_zweite_pandemie.mp3 -O audio.mp3
    ffmpeg -y -i audio.mp3 -ar 16000 -ac 1 -c:a pcm_s16le audio.wav 
fi

python python-whisper.py

