import os
import re
import matplotlib.pyplot as plt

# Config
MCPAT_DIR = "mcpat_ex3"
OUTPUT = "comparison1_dynamic_power_vs_freq_all.pdf"

# Data structure: {opt_level: [(freq, peak_power, mem_model)]}
data = {}

# Regex for filenames
pattern = re.compile(r"mcpat_report_(O\d)_(\d+)MHz_(.+)\.txt")

for filename in os.listdir(MCPAT_DIR):
    match = pattern.match(filename)
    if not match:
        continue

    opt, freq_str, mem_model = match.groups()
    freq = int(freq_str)
    filepath = os.path.join(MCPAT_DIR, filename)

    peak_power = None
    with open(filepath) as f:
        for line in f:
            if "Runtime Dynamic" in line:
                try:
                    peak_power = float(line.split('=')[1].strip().split()[0])
                    break
                except:
                    continue

    if peak_power is None:
        continue

    if opt not in data:
        data[opt] = []
    data[opt].append((freq, peak_power, mem_model))

# Plot settings
plt.figure(figsize=(10, 6))
markers = {"O0": "o", "O1": "s", "O2": "^", "O3": "D"}
colors = {"SimpleMemory": "blue", "DDR3_1600_8x8": "green", "MmioSRAM": "orange"}

# Plot each optimization level's data
for opt, entries in data.items():
    for freq, power, mem in entries:
        label = f"{opt} ({mem})"
        plt.scatter(freq, power, marker=markers.get(opt, "o"),
                    color=colors.get(mem, "black"), label=label)

# Prevent duplicate labels
handles, labels = plt.gca().get_legend_handles_labels()
unique = dict(zip(labels, handles))
plt.legend(unique.values(), unique.keys(), title="Opt Level (Memory)", loc="upper left")

# Final formatting
plt.title("Runtime Dynamic Power vs Frequency (All Configurations)")
plt.xlabel("Frequency (MHz)")
plt.ylabel("Runtime Dynamic Power (W)")
plt.grid(True)
plt.tight_layout()
plt.savefig(OUTPUT)
print(f"Saved: {OUTPUT}")

