###################################################################

# Created by write_sdc on Thu Aug 13 00:25:12 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl10 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports PAR_EN]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports PAR_TYP]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports DATA_VALID]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[7]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[6]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[5]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[4]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[3]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[2]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {P_DATA[0]}]
set_load -pin_load 0.5 [get_ports TX_OUT]
set_load -pin_load 0.5 [get_ports BUSY]
create_clock [get_ports CLK]  -period 8680.56  -waveform {0 4340.28}
set_clock_latency 0  [get_clocks CLK]
set_clock_uncertainty -setup 0.25  [get_clocks CLK]
set_clock_uncertainty -hold 0.05  [get_clocks CLK]
set_clock_transition -max -rise 0.1 [get_clocks CLK]
set_clock_transition -max -fall 0.1 [get_clocks CLK]
set_clock_transition -min -rise 0.1 [get_clocks CLK]
set_clock_transition -min -fall 0.1 [get_clocks CLK]
set_input_delay -clock CLK  2604.17  [get_ports PAR_EN]
set_input_delay -clock CLK  2604.17  [get_ports PAR_TYP]
set_input_delay -clock CLK  2604.17  [get_ports DATA_VALID]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[7]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[6]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[5]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[4]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[3]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[2]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[1]}]
set_input_delay -clock CLK  2604.17  [get_ports {P_DATA[0]}]
set_output_delay -clock CLK  2604.17  [get_ports TX_OUT]
set_output_delay -clock CLK  2604.17  [get_ports BUSY]
