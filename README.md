# ZYNQ_7725_VGA

本工程基于Vivado 2017.4，使用PL和PS协同设计，在Zedboard上实现了摄像头图像的采集和显示。其中，PS使用emio模拟SCCB时序，完成摄像头的寄存器配置；而PL负责实现摄像头的采集时序和VGA时序。

> ### 测试环境：
> Zedboard、OV7725、VGA显示器

管脚约束和Block Design见工程文件。