# 🔬 Design Space Exploration with Gem5 and McPAT

---

### 🧩 1. Scripts and Setup Summary

#### **Exercise 1: Optimization Level Analysis**
- **Benchmark Setup:** The provided `crc32.c` file was compiled into ARM32 and Thumb binaries with optimization flags `-O0` to `-O3`.
- **Script Used:** `run_gem5_ex1.sh`
  - Launched 8 simulations: 4 ARM32 and 4 Thumb binaries using `TimingSimpleCPU` and `SimpleMemory`.
  - Saved simulation statistics in `gem5_ex1/`.
- **McPAT Script:** `run_mcpat_ex1.sh`
  - Converted Gem5 `.txt` statistics to `.xml` using `gem5_to_mcpat.py`.
  - Ran McPAT power analysis and saved results in `mcpat_ex1/`.

#### **Exercise 2: Frequency Scaling Analysis**
- **Benchmark Setup:** Simulated a fixed optimization level (`-O0`) across various **CPU frequencies** (e.g. 200, 800, 1400, 2000 MHz), keeping the memory model constant (`SimpleMemory`).
- **Script Used:** `run_gem5_ex2.sh`
  - Simulated ARM32 binaries at multiple CPU frequencies.
  - Results stored in `gem5_ex2/`.
- **McPAT Script:** `run_mcpat_ex2.sh`
  - Generated `.xml` files and McPAT reports into `mcpat_ex2/`.

#### **Exercise 3: Design Space Exploration (DSE)**
- **Benchmark Adaptation:** `crc32.c` was moved to the project root for easier integration. The benchmark directory was renamed to `crc32_benchmarks/`.
- **Script Used:** `run_gem5_dse.sh`
  - Explored full design space: 3 optimization levels (`-O0` to `-O2`), 4 CPU frequencies (200, 800, 1400, 2000 MHz), and 3 memory models.
  - Simulations stored under `gem5_ex3/`.
- **McPAT Script:** `run_mcpat_dse.sh`
  - Converted results to `.xml`, generated McPAT power reports under `mcpat_ex3/`.

---

### 🧪 2. Methodology for Data Extraction & Analysis

To analyze the simulation results:

1. **Extraction:**
   - Parsed all `gem5_sim_*.txt` files for:
     - Simulated instructions
     - Simulated time (for performance)
   - Parsed all `mcpat_report_*.txt` files for:
     - Peak Dynamic Power
     - Runtime Dynamic Power (when needed)

2. **Post-Processing:**
   - **Performance** = `1 / simSeconds`
   - **Energy Consumption** = `Average Power × simSeconds`
   - CPU frequency and memory model were extracted from filenames to categorize data.

3. **Plotting Tools:**
   - Used `generate_table.py` to convert extracted metrics into a LaTeX table, compiled with `pdflatex`.
   - Used `matplotlib` in Exercise 3 for visualizing:
     - Performance vs Frequency
     - Energy vs Frequency
     - Energy vs Performance (Pareto front)

---

### 📊 3. Findings & Observations

#### **Exercise 1: Optimization Effects**
- `-O2` outperformed `-O1` and `-O0` in performance.
- Thumb binaries were slightly less performant than ARM32, but power savings were negligible.

#### **Exercise 2: Frequency Scaling**
- Performance increased with CPU frequency, but energy efficiency peaked around 1400 MHz.
- Frequencies beyond that showed diminishing returns for increased energy cost.
- Peak power rose linearly with frequency.

#### **Exercise 3: Multi-Dimensional DSE**

**Comparison 1: Performance vs Frequency**
- Performance scaled with frequency, but gains plateaued beyond 1400 MHz.

**Comparison 2: Energy vs Frequency**
- Higher frequencies raised energy consumption due to increased voltage.

**Comparison 3: Energy vs Performance (Pareto Analysis)**
- Pareto-optimal configs:
  - `-O2 @ 1400 MHz, SimpleMemory`
  - `-O1 @ 800 MHz, MmioSRAM`
- Suboptimal: `-O0 @ 2000 MHz` used more energy for poor gains.

---

✅ **Conclusion:**  
The best configurations lie on the Pareto front—high performance, reasonable energy. `-O2` with mid-high frequency and `SimpleMemory` showed the best balance.

