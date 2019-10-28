################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main03.c 

S_UPPER_SRCS += \
../Src/GreenLED.S \
../Src/myDataOps02.S 

OBJS += \
./Src/GreenLED.o \
./Src/main03.o \
./Src/myDataOps02.o 

S_UPPER_DEPS += \
./Src/GreenLED.d \
./Src/myDataOps02.d 

C_DEPS += \
./Src/main03.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW03/Problem1/STM32L476_DiscoBlinky_ws_1/DiscoBlinky/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/LaurenKosub_400F19_HW03/Problem1/STM32L476_DiscoBlinky_ws_1/DiscoBlinky/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


