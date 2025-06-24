#!/bin/bash

clear

GREEN='\e[32m'
NC='\e[0m'      # No Color

echo ""
echo -e "${GREEN}--- Converting Gem5 TXT files to McPAT XML files ---${NC}"
echo ""

[ -d ./mcpat_ex2 ] || mkdir -p ./mcpat_ex2

python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_100MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_100MHz.xml 100
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_200MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_200MHz.xml 200
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_400MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_400MHz.xml 400
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_600MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_600MHz.xml 600
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_800MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_800MHz.xml 800

python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_1000MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_1000MHz.xml 1000
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_1200MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_1200MHz.xml 1200
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_1400MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_1400MHz.xml 1400
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_1600MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_1600MHz.xml 1600
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_1800MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_1800MHz.xml 1800

python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_2000MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_2000MHz.xml 2000
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_2200MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_2200MHz.xml 2200
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_2400MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_2400MHz.xml 2400
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_2600MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_2600MHz.xml 2600
python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_2800MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_2800MHz.xml 2800

python3 ./gem5_to_mcpat.py ./gem5_ex2/gem5_sim_arm32_O0_3000MHz.txt ./mcpat_ex2/gem5_sim_arm32_O0_3000MHz.xml 3000

echo ""
echo -e "${GREEN}--- Running McPAT Power Simulations ---${NC}"
echo ""

~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_100MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_100MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_200MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_200MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_400MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_400MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_600MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_600MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_800MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_800MHz.txt

~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_1000MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_1000MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_1200MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_1200MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_1400MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_1400MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_1600MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_1600MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_1800MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_1800MHz.txt

~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_2000MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_2000MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_2200MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_2200MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_2400MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_2400MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_2600MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_2600MHz.txt
~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_2800MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_2800MHz.txt

~/Tools/mcpat/mcpat -infile ./mcpat_ex2/gem5_sim_arm32_O0_3000MHz.xml -print_level 0 > ./mcpat_ex2/mcpat_report_arm32_O0_3000MHz.txt

echo ""
echo -e "${GREEN}--- DONE ---${NC}"
echo ""
