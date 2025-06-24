'''
Created on 26 Jan 2018

@author: Raul Garcia
'''

'''
Script name: gem5_to_mcpat.py

Script description: This script parses a gem5_stats.txt file and generates a mcpat.xml file.
	            By default the simulated tech node for simulation is 28 nm

Usage: python gem5_to_mcpat.py path_to_gem5_stats_file.txt path_to_generated_mcpat_xml_file cpu_frequency_in_MHz
'''



import sys
import os
import lxml.etree as et

inFile = sys.argv[1]
outFile = sys.argv[2]
clock_rate = sys.argv[3]

core_tech_node = 28 #nm

# Path to the McPAT ARM Processor template file
# tree = et.parse('/home/user/mcpat/ProcessorDescriptionFiles/ARM_A9_2GHz.xml')
path = os.path.expanduser('~/Tools/mcpat/ProcessorDescriptionFiles/ARM_A9_2GHz.xml')
tree = et.parse(path)
root = tree.getroot()

# Path to the GEM5 statistics file
gem5_file = inFile

f = open(gem5_file, "r")
statistics = f.readlines()
f.close()



# fill statistics

for line in statistics:
    lst = line.split()
    if len(lst) > 0:
        stat_name = lst[0]
        stat_value = lst[1]


        # if stat_name == "system.cpu.num_idle_cycles":
        if stat_name == "system.cpu.idleCycles":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'idle_cycles':
                    elem.attrib['value'] = stat_value
            idle_cycles = stat_value

        if stat_name == "system.cpu.numCycles":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'total_cycles':
                    elem.attrib['value'] = stat_value
            total_cycles = stat_value



        if stat_name == "sim_insts":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'total_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iq.fp_alu_accesses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'fp_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iew.exec_branches":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'branch_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iew.branchMispredicts":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'branch_mispredictions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iew.iewExecLoadInsts":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'load_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iew.exec_stores":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'store_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.commit.committedInsts":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'commited_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.commit.int_insts":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'commited_int_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.commit.fp_insts":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'commited_fp_instructions':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.rob.rob_reads":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'ROB_reads':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.rob.rob_writes":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'ROB_writes':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.int_regfile_reads":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'int_regfile_reads':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.fp_regfile_reads":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'float_regfile_reads':
                    elem.attrib['value'] = stat_value
            float_regfile_reads = stat_value


        if stat_name == "system.cpu.int_regfile_writes":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'int_regfile_writes':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.commit.function_calls":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'function_calls':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iq.int_alu_accesses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'ialu_accesses':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.iq.fp_alu_accesses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'fpu_accesses':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.dstage2_mmu.stage2_tlb.accesses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'total_accesses':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.dtb.inst_misses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'total_misses':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.dtb.read_hits":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'read_hits':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.dtb.read_misses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'read_misses':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.dtb.write_hits":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'write_hits':
                    elem.attrib['value'] = stat_value

        if stat_name == "system.cpu.dtb.write_misses":
            for elem in root.iter('stat'):
                if elem.attrib['name'] == 'write_misses':
                    elem.attrib['value'] = stat_value

# busy_cycles = float(total_cycles) - float(idle_cycles)
busy_cycles = float(total_cycles)
busy_cycles = str(busy_cycles)

#float_regfile_writes = int(float_regfile_reads)/2
#float_regfile_writes = str(float_regfile_writes)

for elem in root.iter('stat'):
    if elem.attrib['name'] == 'busy_cycles':
        elem.attrib['value'] = busy_cycles

    if elem.attrib['name'] == 'rename_reads':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'rename_writes':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'fp_rename_reads':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'fp_rename_writes':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'inst_window_reads':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'inst_window_writes':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'inst_window_wakeup_accesses':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'fp_inst_window_reads':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'fp_inst_window_writes':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'fp_inst_window_wakeup_accesses':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'float_regfile_writes':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'context_switches':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'mul_accesses':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'cdb_alu_accesses':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'cdb_mul_accesses':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'cdb_fpu_accesses':
        elem.attrib['value'] = '1'

# fill parameters

for elem in root.iter('param'):
    if elem.attrib['name'] == 'number_of_cores':
        elem.attrib['value'] = '1'

    if elem.attrib['name'] == 'number_of_NoCs':
        elem.attrib['value'] = '0'

    if elem.attrib['name'] == 'core_tech_node':
        elem.attrib['value'] = str(core_tech_node)

    if elem.attrib['name'] == 'target_core_clockrate':
        elem.attrib['value'] = str(clock_rate)

    if elem.attrib['name'] == 'ROB_size':
        elem.attrib['value'] = '0'

    if elem.attrib['name'] == 'clock_rate':
        elem.attrib['value'] = str(clock_rate)

# Write xml tree to file
mcpat_file = open (outFile, 'w')

# tree.write(mcpat_file)

# option 1
tree.write(outFile, encoding='utf-8', xml_declaration=True)

