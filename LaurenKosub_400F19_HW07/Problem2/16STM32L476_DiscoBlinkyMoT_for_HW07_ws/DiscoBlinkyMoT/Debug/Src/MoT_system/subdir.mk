################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Src/MoT_system/MoT_CmdHandler16.S \
../Src/MoT_system/MoT_Comm_stm32L476_4MHZ_USART2_9600N81_01.S \
../Src/MoT_system/MoT_admin_cfg01.S \
../Src/MoT_system/MoT_ringbufbuf03.S 

OBJS += \
./Src/MoT_system/MoT_CmdHandler16.o \
./Src/MoT_system/MoT_Comm_stm32L476_4MHZ_USART2_9600N81_01.o \
./Src/MoT_system/MoT_admin_cfg01.o \
./Src/MoT_system/MoT_ringbufbuf03.o 

S_UPPER_DEPS += \
./Src/MoT_system/MoT_CmdHandler16.d \
./Src/MoT_system/MoT_Comm_stm32L476_4MHZ_USART2_9600N81_01.d \
./Src/MoT_system/MoT_admin_cfg01.d \
./Src/MoT_system/MoT_ringbufbuf03.d 


# Each subdirectory must supply rules for building sources it contributes
Src/MoT_system/%.o: ../Src/MoT_system/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW07/Problem2/16STM32L476_DiscoBlinkyMoT_for_HW07_ws/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


