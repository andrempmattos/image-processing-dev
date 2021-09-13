## ASIC implementation of an simple ALU

### Tools

	- GHDL (analysis, elaboration, and simulation)
	- GTKWave (visualization and inspection)
	- Cadence Virtuoso/Genus/Innovus (systhesis, simulation, and physical implementation)

> Cadence sources, scripts, and sensitive info are not included in the repository due to NDA agreements.

### Usage tips

Windows:
[ghdl_dir]/bin/ghdl.exe -a [rtl_dir]/[file_name].vhd  (run for every .vhd file, top entity at the end)
[ghdl_dir]/bin/ghdl.exe -e [rtl_dir]/[entity_name]    (run for every .vhd file, top entity at the end)
[ghdl_dir]/bin/ghdl.exe -a [sim_dir]/[testbench].vhd
[ghdl_dir]/bin/ghdl.exe -e [sim_dir]/[testbench]
[ghdl_dir]/bin/ghdl.exe -r [sim_dir]/[testbench] --vcd=waves.vcd
[gtkwave_dir]/bin/gtkwave.exe waves.vcd