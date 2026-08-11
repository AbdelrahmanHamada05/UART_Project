onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB -color Magenta /UART_TX_tb/RST
add wave -noupdate -expand -group TB -color {Slate Blue} /UART_TX_tb/CLK
add wave -noupdate -expand -group TB /UART_TX_tb/BUSY
add wave -noupdate -expand -group TB /UART_TX_tb/CLK_PERIOD
add wave -noupdate -expand -group TB /UART_TX_tb/PAR_EN
add wave -noupdate -expand -group TB /UART_TX_tb/PAR_TYP
add wave -noupdate -expand -group TB /UART_TX_tb/DATA_VALID
add wave -noupdate -expand -group TB /UART_TX_tb/P_DATA
add wave -noupdate -expand -group TB /UART_TX_tb/TX_OUT
add wave -noupdate -expand -group TB /UART_TX_tb/expected_frame
add wave -noupdate -expand -group TB /UART_TX_tb/frame
add wave -noupdate -expand -group TB /UART_TX_tb/i
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/IDLE
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/START
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/DATA
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/PARITY
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/STOP
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/serial_done
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/serial_en
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/MUX_sel
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/BUSY
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/current_state
add wave -noupdate -expand -group FSM /UART_TX_tb/DUT/fsm/next_state
add wave -noupdate -expand -group SER /UART_TX_tb/DUT/ser/serial_en
add wave -noupdate -expand -group SER /UART_TX_tb/DUT/ser/serial_data
add wave -noupdate -expand -group SER /UART_TX_tb/DUT/ser/serial_done
add wave -noupdate -expand -group SER /UART_TX_tb/DUT/ser/shift_reg
add wave -noupdate -expand -group SER /UART_TX_tb/DUT/ser/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {391632485561 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3124637680500 ps}
