####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
create_clock -name CLK [get_ports CLK] -period 8680.56 


set_clock_uncertainty -setup 0.25 [get_clocks CLK]
set_clock_uncertainty -hold 0.05 [get_clocks CLK]
set_clock_transition 0.1 [get_clocks CLK]
set_clock_latency 0 [get_clocks CLK]


set_dont_touch [get_clocks CLK]
set_dont_touch_network [get_ports RST]
####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set_input_delay 2604.168 -clock CLK [get_ports {PAR_EN PAR_TYP DATA_VALID P_DATA}]

set_output_delay 2604.168 -clock CLK [get_ports {TX_OUT BUSY}]
####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports {PAR_EN PAR_TYP DATA_VALID P_DATA}]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set_load 0.5 [get_ports {TX_OUT BUSY}]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################
set_wire_load_model -name tsmc13_wl10 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

