# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.cache/wt [current_project]
set_property parent.project_path E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_output_repo e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/imports/new/CAM_RGB565_Capture.v
  E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/imports/new/CAM_Top.v
  E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/imports/new/VGA_Display.v
  E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/hdl/CAM_PS_Configure_wrapper.v
}
add_files E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/CAM_PS_Configure.bd
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_processing_system7_0_0/CAM_PS_Configure_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_axi_gpio_0_0/CAM_PS_Configure_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_axi_gpio_0_0/CAM_PS_Configure_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_axi_gpio_0_0/CAM_PS_Configure_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_rst_ps7_0_100M_0/CAM_PS_Configure_rst_ps7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_rst_ps7_0_100M_0/CAM_PS_Configure_rst_ps7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_rst_ps7_0_100M_0/CAM_PS_Configure_rst_ps7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/ip/CAM_PS_Configure_auto_pc_0/CAM_PS_Configure_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/bd/CAM_PS_Configure/CAM_PS_Configure_ooc.xdc]

read_ip -quiet E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/clk_gen/clk_gen.xci
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/clk_gen/clk_gen_board.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/clk_gen/clk_gen.xdc]
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/clk_gen/clk_gen_ooc.xdc]

read_ip -quiet E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/constrs/new/PL_Constrs.xdc
set_property used_in_implementation false [get_files E:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/constrs/new/PL_Constrs.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top CAM_PS_Configure_wrapper -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef CAM_PS_Configure_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file CAM_PS_Configure_wrapper_utilization_synth.rpt -pb CAM_PS_Configure_wrapper_utilization_synth.pb"