set_property PACKAGE_PIN Y9 [get_ports clk100]
set_property IOSTANDARD LVCMOS33 [get_ports clk100]

set_property PACKAGE_PIN U14 [get_ports {LED[7]}]
set_property PACKAGE_PIN U19 [get_ports {LED[6]}]
set_property PACKAGE_PIN W22 [get_ports {LED[5]}]
set_property PACKAGE_PIN V22 [get_ports {LED[4]}]
set_property PACKAGE_PIN U21 [get_ports {LED[3]}]
set_property PACKAGE_PIN U22 [get_ports {LED[2]}]
set_property PACKAGE_PIN T21 [get_ports {LED[1]}]
set_property PACKAGE_PIN T22 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]

# set_property PACKAGE_PIN T18 [get_ports btn]
# set_property IOSTANDARD LVCMOS33 [get_ports btn]

set_property PACKAGE_PIN AB19 [get_ports {VGA_Blue[3]}]
set_property PACKAGE_PIN Y20 [get_ports {VGA_Blue[1]}]
set_property PACKAGE_PIN AB20 [get_ports {VGA_Blue[2]}]
set_property PACKAGE_PIN Y21 [get_ports {VGA_Blue[0]}]
set_property PACKAGE_PIN AA21 [get_ports {VGA_Green[3]}]
set_property PACKAGE_PIN AB21 [get_ports {VGA_Green[2]}]
set_property PACKAGE_PIN AA22 [get_ports {VGA_Green[1]}]
set_property PACKAGE_PIN AB22 [get_ports {VGA_Green[0]}]
set_property PACKAGE_PIN V18 [get_ports {VGA_Red[3]}]
set_property PACKAGE_PIN V19 [get_ports {VGA_Red[2]}]
set_property PACKAGE_PIN U20 [get_ports {VGA_Red[1]}]
set_property PACKAGE_PIN V20 [get_ports {VGA_Red[0]}]
set_property PACKAGE_PIN AA19 [get_ports VGA_HSYNC]
set_property PACKAGE_PIN Y19 [get_ports VGA_VSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_Green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_HSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_VSYNC]

set_property PACKAGE_PIN N22 [get_ports {CAM_Data[7]}]
set_property PACKAGE_PIN M21 [get_ports {CAM_Data[6]}]
set_property PACKAGE_PIN N17 [get_ports {CAM_Data[5]}]
set_property PACKAGE_PIN M20 [get_ports {CAM_Data[4]}]
set_property PACKAGE_PIN C19 [get_ports {CAM_Data[3]}]
set_property PACKAGE_PIN P22 [get_ports {CAM_Data[2]}]
set_property PACKAGE_PIN M22 [get_ports {CAM_Data[1]}]
# set_property PACKAGE_PIN T16 [get_ports {CAM_Data[0]}]
set_property PACKAGE_PIN T17 [get_ports {CAM_Data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CAM_Data[0]}]

set_property PACKAGE_PIN J22 [get_ports CAM_HSYNC]
set_property PACKAGE_PIN D18 [get_ports CAM_PCLK]
set_property PACKAGE_PIN J21 [get_ports CAM_VSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports CAM_HSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports CAM_PCLK]
set_property IOSTANDARD LVCMOS33 [get_ports CAM_VSYNC]

set_property PULLDOWN true [get_ports {CAM_Data[7]}]
set_property PULLDOWN true [get_ports {CAM_Data[6]}]
set_property PULLDOWN true [get_ports {CAM_Data[5]}]
set_property PULLDOWN true [get_ports {CAM_Data[4]}]
set_property PULLDOWN true [get_ports {CAM_Data[3]}]
set_property PULLDOWN true [get_ports {CAM_Data[2]}]
set_property PULLDOWN true [get_ports {CAM_Data[1]}]
set_property PULLDOWN true [get_ports {CAM_Data[0]}]
set_property PULLDOWN true [get_ports CAM_PCLK]
set_property PULLDOWN true [get_ports CAM_VSYNC]
set_property PULLDOWN true [get_ports CAM_HSYNC]


# PS
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_0_0_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_0_0_tri_io[0]}]
set_property PULLUP true [get_ports {GPIO_0_0_tri_io[0]}]
set_property PULLUP true [get_ports {GPIO_0_0_tri_io[1]}]


set_property PACKAGE_PIN M19 [get_ports {GPIO_0_0_tri_io[1]}]
set_property PACKAGE_PIN T16 [get_ports {GPIO_0_0_tri_io[0]}]



