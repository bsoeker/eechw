#!/bin/bash

clear

GREEN='\e[32m'
NC='\e[0m'      # No Color

echo ""
echo -e "${GREEN}--- Executing GEM5 Simulations ---${NC}"
echo ""

# INFO: my version 2

echo -e "${GREEN}--- Executing GEM5 Simulations ARM32 O0 from 100MHz to 3GHz ---${NC}"

~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_100MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='100MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_200MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='200MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_400MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='400MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_600MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='600MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_800MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='800MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32

~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_1000MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='1000MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_1200MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='1200MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_1400MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='1400MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_1600MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='1600MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_1800MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='1800MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32

~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_2000MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='2000MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_2200MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='2200MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_2400MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='2400MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_2600MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='2600MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32
~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_2800MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='2800MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32

~/Tools/gem5/build/ARM/gem5.opt --stats-file=gem5_sim_arm32_O0_3000MHz.txt ~/Tools/gem5/configs/deprecated/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock='3000MHz' --mem-type=SimpleMemory -c ./crc32_benchmarks/benchmark_matmul_O0_arm32

mv ./m5out/ ./gem5_ex2

echo ""
echo -e "${GREEN}--- DONE ---${NC}"
echo ""
