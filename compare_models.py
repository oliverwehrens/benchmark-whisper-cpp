import os

DIR = "macbookpro-m1pro-32gb"

files = [os.path.join(DIR, "audio.wav-correct.txt")] + [os.path.join(DIR, f"audio.wav-4-{model}.txt") for model in
                                                        ["tiny", "small", "base", "medium", "large-v1", "large"]]
print(files)
content = []
for file in files:
    with open(file, "r") as f:
        content.append((f.read().replace("\n", "")).strip().split())

original = content[0]
for i in [1, 2, 3, 4, 5, 6]:
    print(f"Model {i}: {len(content[i])} words")
    o = original
    result = [word for word in content[i] if word not in original]
    o_result = [word for word in original if word not in content[i]]
    print(f"{i} has {len(result)} left - original has {len(o_result)} left")
    print(f"{i}: {result}")
    print(f"o: {o_result}")
    print(f" Total: {len(result) + len(o_result)} ---")

print(f"Total word in Original: {len(original)}")