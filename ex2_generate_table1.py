import os
import re

# Paths
gem5_dir = "gem5_ex2"
mcpat_dir = "mcpat_ex2"

rows = []

for filename in os.listdir(gem5_dir):
    if not filename.startswith("gem5_sim_") or not filename.endswith(".txt"):
        continue

    # Match: gem5_sim_arm32_O0_1000MHz.txt
    match = re.match(r"gem5_sim_(\w+)_O(\d)_(\d+MHz).txt", filename)
    if not match:
        print(f"Filename did not match pattern: {filename}")
        continue

    arch, opt_digit, freq = match.groups()
    opt = f"-O{opt_digit}"
    arch_upper = arch.upper()

    # File paths
    gem5_path = os.path.join(gem5_dir, filename)
    mcpat_path = os.path.join(mcpat_dir, f"mcpat_report_{arch}_O{opt_digit}_{freq}.txt")

    # --- Extract simSeconds ---
    exec_time = "N/A"
    try:
        with open(gem5_path) as f:
            for line in f:
                if "simSeconds" in line:
                    exec_time = f"{float(line.split()[1]):.6f} sec"
                    break
    except Exception as e:
        print(f"Error reading gem5 file {filename}: {e}")
        continue

    # --- Extract Runtime Dynamic ---
    dyn_power = "N/A"
    try:
        with open(mcpat_path) as f:
            for line in f:
                if "Runtime Dynamic" in line:
                    value = line.split('=')[1].strip().split()[0]
                    dyn_power = f"{float(value):.8f} W"
                    break
    except Exception as e:
        print(f"Error reading McPAT file {mcpat_path}: {e}")
        continue

    rows.append((arch_upper, opt, freq, exec_time, dyn_power))

# Optional: sort by frequency
rows.sort(key=lambda x: int(x[2].replace("MHz", "")))

# --- Print LaTeX Table ---
if rows:
    print(r"\begin{tabular}{|l|c|c|c|c|}")
    print(r"\hline")
    print(r"Executable & Optimization Level & Frequency & Execution Time & Dynamic Power \\")
    print(r"\hline")
    for r in rows:
        print(f"{r[0]} & {r[1]} & {r[2]} & {r[3]} & {r[4]} \\\\")
    print(r"\hline")
    print(r"\end{tabular}")
    print()
    print(r"\textbf{Table 2:} McPAT report vs frequency at fixed optimization level.")
else:
    print("No data parsed.")

