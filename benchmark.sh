#!/bin/sh


if [ ! -f audio.mp3 ]; then
    wget https://adn.podigee.com/adswizz/media/podcast_1652_was_jetzt_episode_818856_update_ein_notstand_aber_keine_zweite_pandemie.mp3 -O audio.mp3
    ffmpeg -y -i audio.mp3 -ar 16000 -ac 1 -c:a pcm_s16le audio.wav 
fi

FILE=audio.wav
WHISPER_DIR=/Users/owehrens/Source/Github/whisper.cpp/
BIN=$WHISPER_DIR/main

DATE=`date +"%Y-%m-%d_%H:%M:%S"`

CORES="6 5 4 3 2 1"
MODELS="tiny small base medium large large-v1"
for MODEL_NAME in $MODELS; do
    for CORE_COUNT in $CORES; do
        MODEL=$WHISPER_DIR/models/ggml-$MODEL_NAME.bin
        echo "Model: $MODEL_NAME Cores: $CORE_COUNT"
        date
        P_FILE=$FILE-$CORE_COUNT-$MODEL_NAME
        ln -s $FILE $P_FILE
        $BIN -t $CORE_COUNT -m $MODEL -l german -otxt -ovtt -osrt $P_FILE > "${DATE}_${CORE_COUNT}_${MODEL_NAME}_output.txt" 2>&1
        rm $P_FILE
    echo $val
    done
done
