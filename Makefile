
compile_benchmarks:
	[ -d ./crc32.c ] || mkdir -p ./crc32_benchmarks
	arm-linux-gnueabi-gcc -static -O0 -marm	  -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O0_arm32
	arm-linux-gnueabi-gcc -static -O1 -marm	  -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O1_arm32
	arm-linux-gnueabi-gcc -static -O2 -marm	  -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O2_arm32
	arm-linux-gnueabi-gcc -static -O3 -marm	  -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O3_arm32
	arm-linux-gnueabi-gcc -static -O0 -mthumb -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O0_thumb
	arm-linux-gnueabi-gcc -static -O1 -mthumb -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O1_thumb
	arm-linux-gnueabi-gcc -static -O2 -mthumb -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O2_thumb
	arm-linux-gnueabi-gcc -static -O3 -mthumb -march=armv7-a ./crc32.c -o ./crc32_benchmarks/benchmark_matmul_O3_thumb

view_stats:
	file ./crc32_benchmarks/benchmark_matmul_O0_arm32
	file ./crc32_benchmarks/benchmark_matmul_O1_arm32
	file ./crc32_benchmarks/benchmark_matmul_O2_arm32
	file ./crc32_benchmarks/benchmark_matmul_O3_arm32
	file ./crc32_benchmarks/benchmark_matmul_O0_thumb
	file ./crc32_benchmarks/benchmark_matmul_O1_thumb
	file ./crc32_benchmarks/benchmark_matmul_O2_thumb
	file ./crc32_benchmarks/benchmark_matmul_O3_thumb

simulate_gem5_example1:
	bash ./run_gem5_ex1.sh

simulate_mcpat_example1:
	bash ./run_mcpat_ex1.sh

simulate_gem5_example2:
	bash ./run_gem5_ex2.sh

simulate_mcpat_example2:
	bash ./run_mcpat_ex2.sh

clean:
	rm -rf ./crc32_benchmarks
	rm -rf ./gem5_ex1 ./mcpat_ex1
	rm -rf ./gem5_ex2 ./mcpat_ex2
	rm -rf ./gem5_dse_ex1 ./mcpat_dse_ex1




simulate_gem5_dse:
	bash ./run_gem5_dse.sh

simulate_mcpat_dse:
	bash ./run_mcpat_dse.sh
