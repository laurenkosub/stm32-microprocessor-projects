################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include startup/subdir.mk
-include Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: DiscoBlinky.elf

# Tool invocations
DiscoBlinky.elf: $(OBJS) $(USER_OBJS) /home/lkosub/ENEE440/LaurenKosub_400F19_HW01/STM32L476_DiscoBlinky_ws_1/DiscoBlinky/LinkerScript.ld
	@echo 'Building target: $@'
	@echo 'Invoking: MCU GCC Linker'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -nostartfiles -nodefaultlibs -nostdlib -T"/home/lkosub/ENEE440/LaurenKosub_400F19_HW01/STM32L476_DiscoBlinky_ws_1/DiscoBlinky/LinkerScript.ld" -Wl,-Map=output.map -Wl,--gc-sections -o "DiscoBlinky.elf" @"objects.list" $(USER_OBJS) $(LIBS) -lm
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

post-build:
	-@echo 'Generating binary and Printing size information:'
	arm-none-eabi-objcopy -O binary "DiscoBlinky.elf" "DiscoBlinky.bin"
	arm-none-eabi-size "DiscoBlinky.elf"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
