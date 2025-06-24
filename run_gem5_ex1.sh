#!/bin/bash

clear

GREEN='\e[32m'
NC='\e[0m'      # No Color

echo ""
echo -e "${GREEN}--- Executing GEM5 Simulations ---${NC}"
echo ""

echo -e "${GREEN}--- Executing GEM5 Simulations ARM32 O0 - O3 ---${NC}"
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O1.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O1_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O2.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O2_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O3.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O3_arm32

echo -e "${GREEN}--- Executing GEM5 Simulations Thumb O0 - O3 ---${NC}"
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_thumb_O0.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O0_thumb
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_thumb_O1.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O1_thumb
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_thumb_O2.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O2_thumb
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_thumb_O3.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='650MHz' --mem-type=SimpleMemory -c ./c_benchmarks/benchmark_matmul_O3_thumb

mv ./m5out/ ./gem5_ex1

echo ""
echo -e "${GREEN}--- DONE ---${NC}"
echo ""
