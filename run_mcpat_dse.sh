#!/bin/bash

clear
GREEN='\e[32m'
NC='\e[0m'      # No Color

echo ""
echo -e "${GREEN}--- Converting Gem5 TXT files to McPAT XML files (EX3) ---${NC}"
echo ""

[ -d ./mcpat_ex3 ] || mkdir -p ./mcpat_ex3

FREQS=("200" "800" "1400" "2000")
OPTS=("O0" "O1" "O2")
MEMS=("SimpleMemory" "DDR3_1600_8x8" "MmioSRAM")

for opt in "${OPTS[@]}"; do
  for freq in "${FREQS[@]}"; do
    for mem in "${MEMS[@]}"; do
      INPUT_FILE="./gem5_ex3/gem5_sim_${opt}_${freq}MHz_${mem}.txt"
      XML_OUT="./mcpat_ex3/gem5_sim_${opt}_${freq}MHz_${mem}.xml"
      echo -e "${GREEN}→ Generating XML for ${opt}_${freq}MHz_${mem}${NC}"
      python3 ./gem5_to_mcpat.py "$INPUT_FILE" "$XML_OUT" "$freq"
    done
  done
done

echo ""
echo -e "${GREEN}--- Running McPAT Power Simulations (EX3) ---${NC}"
echo ""

for opt in "${OPTS[@]}"; do
  for freq in "${FREQS[@]}"; do
    for mem in "${MEMS[@]}"; do
      XML_IN="./mcpat_ex3/gem5_sim_${opt}_${freq}MHz_${mem}.xml"
      REPORT_OUT="./mcpat_ex3/mcpat_report_${opt}_${freq}MHz_${mem}.txt"
      echo -e "${GREEN}→ Running McPAT on ${opt}_${freq}MHz_${mem}${NC}"
      ~/Tools/mcpat/mcpat -infile "$XML_IN" -print_level 0 > "$REPORT_OUT"
    done
  done
done

echo ""
echo -e "${GREEN}--- DONE ---${NC}"
echo ""

