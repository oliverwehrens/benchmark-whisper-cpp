# What

I wanted to checkout how whisper.cpp performce for transcribing german speech.
I took a exact 10 minute audio file (looking in podcast rss feeds for \<itunes:duration\>600</itunes:duration> helps) and run different tests.

# Testing performance for whisper.cpp

This test runs the cpp implementation of OpenAI Whisper for a 10 minute audiofile with different cores and models.

Whisper.cpp is available from https://github.com/ggerganov/whisper.cpp


# Requirements

Installed Binaries:

ffmpeg, wget, whisper.cpp

For Whisper.cpp installed models:

small, medium, large 

Audio file will be downloaded during the process.


# Run
Adjust models names and CPU Counts in the file itself.

Change the location of the whisper.cpp git checkout with the build binary


```sh ./benchmark.sh```


# Compare to a GPU enabled Whisper

I can not not use it, but I would be very interested hwo whiser.cpp compared to the CUDA enabled version. If you have such a setup: Please run ```sh ./run_python_whisper.sh```. This will the file and run the OpenAI Python implementation.