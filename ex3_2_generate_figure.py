import os
import re
import matplotlib.pyplot as plt

# --- Config ---
GEM5_DIR = "gem5_ex3"
MCPAT_DIR = "mcpat_ex3"
OUTPUT = "comparison2_energy_vs_freq.pdf"
APPLY_VOLTAGE_SCALING = True  # Set to False if you don't want V² scaling

# Frequency → Voltage mapping
VOLTAGE_MAP = {
    "200MHz": 0.9,
    "800MHz": 1.1,
    "1400MHz": 1.4,
    "2000MHz": 1.8,
}

# Data structure: {opt: [(freq_MHz, energy_J, mem_model)]}
data = {}

# --- Parse filenames like: mcpat_report_O1_800MHz_SimpleMemory.txt ---
pattern = re.compile(r"mcpat_report_(O\d)_(\d+)MHz_(.+)\.txt")

for filename in os.listdir(MCPAT_DIR):
    match = pattern.match(filename)
    if not match:
        continue

    opt, freq_str, mem_model = match.groups()
    freq_label = f"{freq_str}MHz"
    freq = int(freq_str)

    mcpat_path = os.path.join(MCPAT_DIR, filename)
    gem5_path = os.path.join(GEM5_DIR, f"gem5_sim_{opt}_{freq_label}_{mem_model}.txt")

    # --- Extract Runtime Dynamic Power ---
    runtime_power = None
    with open(mcpat_path) as f:
        for line in f:
            if "Runtime Dynamic" in line:
                try:
                    runtime_power = float(line.split("=")[1].strip().split()[0])
                    break
                except:
                    continue

    if runtime_power is None:
        continue

    # --- Extract simSeconds ---
    sim_seconds = None
    with open(gem5_path) as f:
        for line in f:
            if "simSeconds" in line:
                try:
                    sim_seconds = float(line.split()[1])
                    break
                except:
                    continue

    if sim_seconds is None:
        continue

    # --- Energy Calculation ---
    vdd = VOLTAGE_MAP.get(freq_label, 1.0)
    scaling_factor = (vdd / 1.0) ** 2 if APPLY_VOLTAGE_SCALING else 1.0
    energy = runtime_power * sim_seconds * scaling_factor

    if opt not in data:
        data[opt] = []
    data[opt].append((freq, energy, mem_model))

# --- Plot ---
plt.figure(figsize=(10, 6))
markers = {"O0": "o", "O1": "s", "O2": "^", "O3": "D"}
colors = {"SimpleMemory": "blue", "DDR3_1600_8x8": "green", "MmioSRAM": "orange"}

for opt, entries in data.items():
    for freq, energy, mem in entries:
        label = f"{opt} ({mem})"
        plt.scatter(freq, energy,
                    marker=markers.get(opt, "o"),
                    color=colors.get(mem, "gray"),
                    label=label)

# Deduplicate legend
handles, labels = plt.gca().get_legend_handles_labels()
seen = set()
unique_handles = []
unique_labels = []
for h, l in zip(handles, labels):
    if l not in seen:
        seen.add(l)
        unique_handles.append(h)
        unique_labels.append(l)

plt.legend(unique_handles, unique_labels, title="Opt Level (Memory)", loc="upper left")
plt.title("Energy vs Frequency (All Configurations)")
plt.xlabel("Frequency (MHz)")
plt.ylabel("Energy (Joules)")
plt.grid(True)
plt.tight_layout()
plt.savefig(OUTPUT)
print(f"Saved: {OUTPUT}")

