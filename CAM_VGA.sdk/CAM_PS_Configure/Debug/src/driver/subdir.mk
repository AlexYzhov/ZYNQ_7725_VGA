################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/driver/OV7725_drv.c \
../src/driver/SCCB_drv.c 

OBJS += \
./src/driver/OV7725_drv.o \
./src/driver/SCCB_drv.o 

C_DEPS += \
./src/driver/OV7725_drv.d \
./src/driver/SCCB_drv.d 


# Each subdirectory must supply rules for building sources it contributes
src/driver/%.o: ../src/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"E:\Proj_ZYNQ\CAM_VGA\CAM_VGA.sdk\CAM_PS_Configure\src" -I"E:\Proj_ZYNQ\CAM_VGA\CAM_VGA.sdk\CAM_PS_Configure_wrapper_hw_platform_0" -I"E:\Proj_ZYNQ\CAM_VGA\CAM_VGA.sdk\CAM_PS_Configure\src\app" -I"E:\Proj_ZYNQ\CAM_VGA\CAM_VGA.sdk\CAM_PS_Configure\src\driver" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../CAM_PS_Configure_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


