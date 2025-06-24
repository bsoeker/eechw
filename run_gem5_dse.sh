#!/bin/bash

clear
GREEN='\e[32m'
NC='\e[0m'

echo -e "${GREEN}--- Running Full DSE (Opt × Freq × Mem) ---${NC}"

OPTS=("O0" "O1" "O2")
FREQS=("200MHz" "800MHz" "1400MHz" "2000MHz")
MEMS=("SimpleMemory" "DDR3_1600_8x8" "MmioSRAM")

OUTDIR="./gem5_ex3"
BENCHDIR="./crc32_benchmarks"
mkdir -p "$OUTDIR"

for opt in "${OPTS[@]}"; do
  for freq in "${FREQS[@]}"; do
    for mem in "${MEMS[@]}"; do
      BIN="$BENCHDIR/benchmark_crc32_${opt}_arm32"
      OUTFILE="gem5_sim_${opt}_${freq}_${mem}.txt"

      echo -e "${GREEN}→ Running $opt | $freq | $mem${NC}"
      ~/Tools/gem5/build/ARM/gem5.opt \
        --stats-file="$OUTFILE" \
        ~/Tools/gem5/configs/deprecated/example/se.py \
        --cpu-type=TimingSimpleCPU \
        --cpu-clock="$freq" \
        --mem-type="$mem" \
        -c "$BIN"
    done
  done
done

mv ./m5out/ "$OUTDIR"

echo -e "${GREEN}--- DSE COMPLETE ---${NC}"

