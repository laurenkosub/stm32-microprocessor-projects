################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main06.c 

S_UPPER_SRCS += \
../Src/MoTdevice_GreenLED07.S \
../Src/stm32L476Disco_GreenLED.S \
../Src/stm32L476Disco_USART2_9600N81.S 

OBJS += \
./Src/MoTdevice_GreenLED07.o \
./Src/main06.o \
./Src/stm32L476Disco_GreenLED.o \
./Src/stm32L476Disco_USART2_9600N81.o 

S_UPPER_DEPS += \
./Src/MoTdevice_GreenLED07.d \
./Src/stm32L476Disco_GreenLED.d \
./Src/stm32L476Disco_USART2_9600N81.d 

C_DEPS += \
./Src/main06.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW04/Problem1/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW04/Problem1/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


