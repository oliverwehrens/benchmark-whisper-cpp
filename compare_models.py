import os

DIR = "macbookpro-1mpro-32gb"

files = [os.path.join(DIR, f"audio.wav-4-{model}.txt") for model in ["large", "medium", "small"]]+[f"{DIR}/audio.wav-correct.txt"]
print(files)
content = []
for file in files:
    with open(file, "r") as f:
        content.append((f.read().replace("\n", "")).strip().split())

original = content[3]
for i in [0,1,2]:
    o = original
    result = [word for word in content[i] if word not in original]
    o_result = [word for word in original if word not in content[i]]
    print(f"{i} has {len(result)} left - original has {len(o_result)} left")
    print(f"{i}: {result}")
    print(f"o: {o_result}")
    print(f" Total: {len(result)+len(o_result)} ---")



