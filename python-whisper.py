import json
import time

import whisper

start = time.time()
model = whisper.load_model("large")
output = model.transcribe("audio.wav")
end = time.time()

print(f"Transcribed in {end - start} seconds")
with open("transcription.json", "w") as f:
    f.write(json.dumps(output))
