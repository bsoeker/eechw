#!/bin/bash

clear

GREEN='\e[32m'
NC='\e[0m'      # No Color

echo ""
echo -e "${GREEN}--- Converting Gem5 TXT files to McPAT XML files ---${NC}"
echo ""

[ -d ./mcpat_ex1 ] || mkdir -p ./mcpat_ex1

python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_arm32_O0.txt ./mcpat_ex1/gem5_sim_arm32_O0.xml 650
python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_arm32_O1.txt ./mcpat_ex1/gem5_sim_arm32_O1.xml 650
python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_arm32_O2.txt ./mcpat_ex1/gem5_sim_arm32_O2.xml 650
python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_arm32_O3.txt ./mcpat_ex1/gem5_sim_arm32_O3.xml 650

python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_thumb_O0.txt ./mcpat_ex1/gem5_sim_thumb_O0.xml 650
python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_thumb_O1.txt ./mcpat_ex1/gem5_sim_thumb_O1.xml 650
python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_thumb_O2.txt ./mcpat_ex1/gem5_sim_thumb_O2.xml 650
python3 ./gem5_to_mcpat.py ./gem5_ex1/gem5_sim_thumb_O3.txt ./mcpat_ex1/gem5_sim_thumb_O3.xml 650

echo ""
echo -e "${GREEN}--- Running McPAT Power Simulations ---${NC}"
echo ""

~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_arm32_O0.xml -print_level 0 > ./mcpat_ex1/mcpat_report_arm32_O0.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_arm32_O1.xml -print_level 0 > ./mcpat_ex1/mcpat_report_arm32_O1.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_arm32_O2.xml -print_level 0 > ./mcpat_ex1/mcpat_report_arm32_O2.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_arm32_O3.xml -print_level 0 > ./mcpat_ex1/mcpat_report_arm32_O3.txt

~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_thumb_O0.xml -print_level 0 > ./mcpat_ex1/mcpat_report_thumb_O0.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_thumb_O1.xml -print_level 0 > ./mcpat_ex1/mcpat_report_thumb_O1.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_thumb_O2.xml -print_level 0 > ./mcpat_ex1/mcpat_report_thumb_O2.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex1/gem5_sim_thumb_O3.xml -print_level 0 > ./mcpat_ex1/mcpat_report_thumb_O3.txt

echo ""
echo -e "${GREEN}--- DONE ---${NC}"
echo ""
