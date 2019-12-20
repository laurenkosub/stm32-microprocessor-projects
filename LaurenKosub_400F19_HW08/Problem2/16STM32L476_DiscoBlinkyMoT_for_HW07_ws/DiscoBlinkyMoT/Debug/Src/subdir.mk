################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main09.c 

S_UPPER_SRCS += \
../Src/MoTdevice_GreenLED08.S \
../Src/MoTdevice_TIM2PWM02.S \
../Src/misc_utilities.S \
../Src/stm32L476xx_ADC1_01-obfuscated.S 

OBJS += \
./Src/MoTdevice_GreenLED08.o \
./Src/MoTdevice_TIM2PWM02.o \
./Src/main09.o \
./Src/misc_utilities.o \
./Src/stm32L476xx_ADC1_01-obfuscated.o 

S_UPPER_DEPS += \
./Src/MoTdevice_GreenLED08.d \
./Src/MoTdevice_TIM2PWM02.d \
./Src/misc_utilities.d \
./Src/stm32L476xx_ADC1_01-obfuscated.d 

C_DEPS += \
./Src/main09.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW08/Problem2/16STM32L476_DiscoBlinkyMoT_for_HW07_ws/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW08/Problem2/16STM32L476_DiscoBlinkyMoT_for_HW07_ws/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


