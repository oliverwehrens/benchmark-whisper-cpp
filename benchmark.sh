#!/bin/sh


if [ ! -f audio.mp3 ]; then
    wget https://adn.podigee.com/adswizz/media/podcast_1652_was_jetzt_episode_847930_update_eine_gefahrliche_mission.mp3 -O audio.mp3 
    ffmpeg -y -i audio.mp3 -ar 16000 -ac 1 -c:a pcm_s16le audio.wav 
fi

FILE=audio.wav
WHISPER_DIR=/Users/owehrens/Source/Github/whisper.cpp/
BIN=$WHISPER_DIR/main

CORES="6 4 2"
MODELS="small medium large"
for MODEL_NAME in $MODELS; do
    for CORE_COUNT in $CORES; do
        MODEL=$WHISPER_DIR/models/ggml-$MODEL_NAME.bin
        echo "Model: $MODEL_NAME Cores: $CORE_COUNT\n\n"
        P_FILE=$FILE-$CORE_COUNT-$MODEL_NAME
        ln -s $FILE $P_FILE
        time $BIN -t $CORE_COUNT -m $MODEL -l german -otxt -ovtt -osrt $P_FILE > /dev/null 2>&1
        rm $P_FILE
    echo $val
    done
done
