
##Switches
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports {ctrl[0]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {ctrl[1]}]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {ctrl[2]}]

##LEDs
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {led[3]}]

create_clock -period 1.500 -name clock1 -waveform {0.000 0.750} -add
set_input_delay -clock clock1 -min 3.000 [get_ports -filter { NAME =~  "*" && DIRECTION == "IN" }]
set_output_delay -clock clock1 -max 2.000 [get_ports -filter { NAME =~  "*" && DIRECTION == "OUT" }]
create_clock -period 1.500 -name clock1 -waveform {0.000 0.750} -add
