################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2/platform/service/system/src/sl_system_init.c \
/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2/platform/service/system/src/sl_system_process_action.c 

OBJS += \
./gecko_sdk_4.2.3/platform/service/system/src/sl_system_init.o \
./gecko_sdk_4.2.3/platform/service/system/src/sl_system_process_action.o 

C_DEPS += \
./gecko_sdk_4.2.3/platform/service/system/src/sl_system_init.d \
./gecko_sdk_4.2.3/platform/service/system/src/sl_system_process_action.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.2.3/platform/service/system/src/sl_system_init.o: /Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2/platform/service/system/src/sl_system_init.c gecko_sdk_4.2.3/platform/service/system/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DEFR32BG22C224F512IM40=1' '-DSL_APP_PROPERTIES=1' '-DBOOTLOADER_APPLOADER=1' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_2400=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1' '-DSL_BOARD_NAME="BRD4184B"' '-DSL_BOARD_REV="A04"' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' '-DSLI_RADIOAES_REQUIRES_MASKING=1' -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2/config" -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2/config/btconf" -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/Device/SiliconLabs/EFR32BG22/Include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/common/util/app_assert" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/common/util/app_log" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//protocol/bluetooth/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/common/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//hardware/board/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/bootloader" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/bootloader/api" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/driver/button/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/CMSIS/Core/Include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_cryptoacc_library/include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_cryptoacc_library/src" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/device_init/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/dmadrv/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/common/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emlib/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/bluetooth/common/gatt_service_device_information" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/gpiointerrupt/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/hfxo_manager/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/bluetooth/common/in_place_ota_dfu" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/iostream/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/driver/leddrv/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_mbedtls_support/config" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_mbedtls_support/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//util/third_party/mbedtls/include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//util/third_party/mbedtls/library" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/mpu/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/nvm3/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/power_manager/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_psa_driver/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_psa_driver/inc/public" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/common" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/protocol/ble" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/protocol/ieee802154" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/protocol/zwave" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/chip/efr32/efr32xg2x" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/plugin/pa-conversions" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/plugin/pa-conversions/efr32xg22" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/plugin/rail_util_pti" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/se_manager/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/se_manager/src" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//util/silicon_labs/silabs_core/memory_manager" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/common/toolchain/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/system/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/sleeptimer/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_protocol_crypto/src" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/udelay/inc" -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2/autogen" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.2.3/platform/service/system/src/sl_system_init.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.2.3/platform/service/system/src/sl_system_process_action.o: /Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2/platform/service/system/src/sl_system_process_action.c gecko_sdk_4.2.3/platform/service/system/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DEFR32BG22C224F512IM40=1' '-DSL_APP_PROPERTIES=1' '-DBOOTLOADER_APPLOADER=1' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_2400=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1' '-DSL_BOARD_NAME="BRD4184B"' '-DSL_BOARD_REV="A04"' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' '-DSLI_RADIOAES_REQUIRES_MASKING=1' -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2/config" -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2/config/btconf" -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/Device/SiliconLabs/EFR32BG22/Include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/common/util/app_assert" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/common/util/app_log" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//protocol/bluetooth/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/common/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//hardware/board/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/bootloader" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/bootloader/api" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/driver/button/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/CMSIS/Core/Include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_cryptoacc_library/include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_cryptoacc_library/src" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/device_init/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/dmadrv/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/common/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emlib/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/bluetooth/common/gatt_service_device_information" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/gpiointerrupt/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/hfxo_manager/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//app/bluetooth/common/in_place_ota_dfu" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/iostream/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/driver/leddrv/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_mbedtls_support/config" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_mbedtls_support/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//util/third_party/mbedtls/include" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//util/third_party/mbedtls/library" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/mpu/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/nvm3/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/power_manager/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_psa_driver/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_psa_driver/inc/public" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/common" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/protocol/ble" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/protocol/ieee802154" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/protocol/zwave" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/chip/efr32/efr32xg2x" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/plugin/pa-conversions" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/plugin/pa-conversions/efr32xg22" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/radio/rail_lib/plugin/rail_util_pti" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/se_manager/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/se_manager/src" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//util/silicon_labs/silabs_core/memory_manager" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/common/toolchain/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/system/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/sleeptimer/inc" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/security/sl_component/sl_protocol_crypto/src" -I"/Users/huzefagadi/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/udelay/inc" -I"/Users/huzefagadi/SimplicityStudio/v5_workspace/bt_soc_blinky_2/autogen" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.2.3/platform/service/system/src/sl_system_process_action.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


