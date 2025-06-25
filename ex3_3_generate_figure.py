import os
import re
import matplotlib.pyplot as plt

# --- Config ---
GEM5_DIR = "gem5_ex3"
MCPAT_DIR = "mcpat_ex3"
OUTPUT = "comparison3_energy_vs_performance.pdf"
APPLY_VOLTAGE_SCALING = True

VOLTAGE_MAP = {
    "200MHz": 0.9,
    "800MHz": 1.1,
    "1400MHz": 1.4,
    "2000MHz": 1.8,
}

# Data structure: [(energy_J, performance, opt_level, mem_model)]
points = []

# Match files like: mcpat_report_O0_1400MHz_SimpleMemory.txt
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

    # Extract power
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

    # Extract time
    sim_seconds = None
    with open(gem5_path) as f:
        for line in f:
            if "simSeconds" in line:
                try:
                    sim_seconds = float(line.split()[1])
                    break
                except:
                    continue
    if sim_seconds is None or sim_seconds == 0:
        continue

    # Compute energy and performance
    vdd = VOLTAGE_MAP.get(freq_label, 1.0)
    scaling = (vdd / 1.0)**2 if APPLY_VOLTAGE_SCALING else 1.0
    energy = runtime_power * sim_seconds * scaling
    performance = 1.0 / sim_seconds

    points.append((energy, performance, opt, mem_model))

# --- Pareto Frontier Detection ---
def is_dominated(p1, others):
    """Returns True if p1 is dominated by any point in others"""
    e1, perf1 = p1
    for e2, perf2 in others:
        if e2 <= e1 and perf2 >= perf1 and (e2 < e1 or perf2 > perf1):
            return True
    return False

pareto_points = []
for p in points:
    e, pval, *_ = p
    if not is_dominated((e, pval), [(x[0], x[1]) for x in points]):
        pareto_points.append(p)

# --- Plotting ---
plt.figure(figsize=(10, 6))
markers = {"O0": "o", "O1": "s", "O2": "^", "O3": "D"}
colors = {"SimpleMemory": "blue", "DDR3_1600_8x8": "green", "MmioSRAM": "orange"}

for energy, perf, opt, mem in points:
    plt.scatter(energy, perf,
                marker=markers.get(opt, "o"),
                color=colors.get(mem, "gray"),
                label=f"{opt} ({mem})")

# Highlight Pareto frontier
for energy, perf, *_ in pareto_points:
    plt.scatter(energy, perf, facecolors='none', edgecolors='red', s=100, linewidths=1.5)

# Deduplicate legend
handles, labels = plt.gca().get_legend_handles_labels()
seen = set()
unique_h, unique_l = [], []
for h, l in zip(handles, labels):
    if l not in seen:
        seen.add(l)
        unique_h.append(h)
        unique_l.append(l)

plt.legend(unique_h, unique_l, title="Opt Level (Memory)", loc="upper right")
plt.title("Energy vs Performance (All Configurations)")
plt.xlabel("Energy (Joules)")
plt.ylabel("Performance (1 / Execution Time)")
plt.grid(True)
plt.tight_layout()
plt.savefig(OUTPUT)
print(f"Saved: {OUTPUT}")

