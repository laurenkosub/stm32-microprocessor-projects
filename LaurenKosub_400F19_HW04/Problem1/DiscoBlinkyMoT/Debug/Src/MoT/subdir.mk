################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Src/MoT/MoT_Cmd_Handler16.S \
../Src/MoT/MoT_Msg_Handler201.S \
../Src/MoT/MoT_admin_cfg01.S 

OBJS += \
./Src/MoT/MoT_Cmd_Handler16.o \
./Src/MoT/MoT_Msg_Handler201.o \
./Src/MoT/MoT_admin_cfg01.o 

S_UPPER_DEPS += \
./Src/MoT/MoT_Cmd_Handler16.d \
./Src/MoT/MoT_Msg_Handler201.d \
./Src/MoT/MoT_admin_cfg01.d 


# Each subdirectory must supply rules for building sources it contributes
Src/MoT/%.o: ../Src/MoT/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW04/Problem1/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


