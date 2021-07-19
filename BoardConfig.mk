#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/grandppltedx
BOARD_VENDOR := samsung

# assert
TARGET_OTA_ASSERT_DEVICE := grandpplte,grandppltedx,grandpplteub,grandpplteser,grandppltedtvvj

# CFLAG
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
BOARD_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Project Configs
MTK_PROJECT_CONFIG ?= $(DEVICE_PATH)/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MT6737T
TARGET_NO_BOOTLOADER := true
# mt6737t

# Platform
TARGET_INIT_VENDOR_LIB := libinit_grandpplte

ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6737t
TARGET_NO_FACTORYIMAGE := true
TARGET_BOARD_PLATFORM_GPU := mali-T720mp2

MTK_GPU_VERSION := mali midgard r18p0
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_MTK_MEDIA_PROFILES := true

TARGET_PROVIDES_LIBLIGHT := true

PRODUCT_SHIPPING_API_LEVEL := 23

# Dexpreopt
WITH_DEXPREOPT := false
DONT_DEXPREOPT_PREBUILTS := true

# Backlight
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Lights
TARGET_HAS_BACKLIT_KEYS := false

# Charger (borrow from herolte)
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging

# Architecture
TARGET_SOC          := mt6737t
TARGET_ARCH         := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI      := armeabi-v7a
TARGET_CPU_ABI2     := armeabi
TARGET_CPU_VARIANT  := cortex-a53
TARGET_CPU_SMP      := true

TARGET_2ND_ARCH         := 
TARGET_2ND_ARCH_VARIANT := 
TARGET_2ND_CPU_ABI      := 
TARGET_2ND_CPU_ABI2     :=  
TARGET_2ND_CPU_VARIANT  := 

# Block
BOARD_BOOTIMAGE_PARTITION_SIZE        := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 3229614080
BOARD_CACHEIMAGE_PARTITION_SIZE       := 419430400
BOARD_FLASH_BLOCK_SIZE                := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE    := 3900702720

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE    := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_SUPPRESS_SECURE_ERASE := true

# Kernel
BOARD_CUSTOM_BOOTIMG := true

BOARD_KERNEL_IMAGE_NAME := zImage
# al: Test mainline kernel
TARGET_KERNEL_SOURCE    := kernel/samsung/grandppltedx
#TARGET_KERNEL_SOURCE    := kernel/samsung/mainline-test
TARGET_KERNEL_CONFIG    := mt6737t-grandpplte_defconfig
TARGET_PREBUILT_DTB 	:= $(DEVICE_PATH)/dt.img

BOARD_KERNEL_CMDLINE  := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE     := 0x3fffc000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET  := 0x04004000
BOARD_SECOND_OFFSET   := 0x00f04000
BOARD_TAGS_OFFSET     := 0x0e004000
BOARD_KERNEL_OFFSET   := 0x00008000
BOARD_DT_SIZE         := 485376
ifeq ($(RECOVERY_VARIANT),twrp)
BOARD_NAME            := SRPPI01A000RU
else
BOARD_NAME            := SRPPI01A000KU
endif

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --second_offset $(BOARD_SECOND_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET) --board $(BOARD_NAME) --dt $(TARGET_PREBUILT_DTB)
# CMHW
BOARD_USES_LINEAGE_HARDWARE := true
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

# Recovery
#RECOVERY_VARIANT := twrp
BOARD_HAS_NO_SELECT_BUTTON := true

ifeq ($(RECOVERY_VARIANT),twrp) #build TWRP

#-- common
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/configs/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := "/sys/devices/ktd3102-bl/lcd-backlight/brightness"
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
DEVICE_RESOLUTION := 540x960
DEVICE_SCREEN_WIDTH := 540
DEVICE_SCREEN_HEIGHT := 960

TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
MALLOC_SVELTE := true
PROTOBUF_SUPPORTED := true

#-- Encryption support
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

#--twrp
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi
#TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone0/temp
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := /sys/devices/ktd3102-bl/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 162
TW_USE_TOOLBOX := true
TW_HAS_DOWNLOAD_MODE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_EXCLUDE_TWRPAPP := true

#-- exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

#-- NTFS Support
TW_INCLUDE_FUSE_NTFS := true

#--pbrp
PB_DISABLE_DEFAULT_DM_VERITY := true
PB_DISABLE_DEFAULT_TREBLE_COMP := true

#--pbrp: add support for flashlight
LINKER_FORCED_SHIM_LIBS := \
	/system/lib/hw/camera.mt6735.so|libshim_camera.so:\
	/system/lib/hw/camera.mt6735.so|mtk_symbols.so:\
	/system/lib/libcam.camadapter.so|libshim_camera.so:\
	/system/lib/libcam.client.so|mtk_symbols.so
	
else #build ROM
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6735

# Move symlinks here
LINKER_FORCED_SHIM_LIBS := \
	/system/lib/libdpframework.so|liblog_mtk.so:\
	/system/lib/hw/audio.primary.mt6735.so|liblog_mtk.so:\
	/system/lib/libMtkOmxAlacDec.so|liblog_mtk.so:\
	/system/bin/mdlogger|liblog_mtk.so:\
	/system/bin/mtk_agpsd|liblog_mtk.so:\
	/system/bin/mobile_log_d|liblog_mtk.so:\
	/system/bin/fsck_msdos_mtk|liblog_mtk.so:\
	/system/bin/mmp|liblog_mtk.so:\
	/system/xbin/mnld|liblog_mtk.so\
	/system/lib/libcam_utils.so|libshim_camera.so:\
	/system/bin/thermal|libshim_thermal.so:\
	/system/bin/emdlogger1|liblog_mtk.so:\
	/system/bin/xlog|liblog_mtk.so:\
	/system/bin/xlog|libshim_xlog.so:\
	/system/bin/mtk_agpsd|libshim_agpsd.so:\
	/system/lib/libMtkOmxVenc.so|mtk_symbols.so:\
	/system/lib/hw/camera.mt6735.so|libshim_camera.so:\
	/system/lib/hw/camera.mt6735.so|mtk_symbols.so:\
	/system/lib/libcam.camadapter.so|libshim_camera.so:\
	/system/lib/libcam.client.so|mtk_symbols.so:\
	/system/bin/mtk_agpsd|mtk_symbols.so:\
	/system/lib/libaudio_param_parser.so|mtk_symbols.so

# temporary. This'll be useful when buiding
# libril + libsecril-client from source
#
#	:\
#	/system/lib/hw/audio.primary.mt6735.so|libaudio-ril.so:\
#	/system/lib/libril.so|libsecril-client.so:\
#	/system/lib/libaudio-ril.so|libsecril-client.so:\
#	/system/bin/at_distributor|libsecril-client.so:\
	
LD_PRELOADS += mtk_symbols.so

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_MTK_AUDIO := true
#-- Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Bluetooth
MTK_BT_SUPPORT := yes
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Media
MTK_MEDIA_PROFILES := true
BOARD_USES_MTK_MEDIA_PROFILES := true

TARGET_OMX_LEGACY_RESCALING := true

BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# GPS # MT6625L
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# RIL
# use prebuilt for now

BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := false
BOARD_PROVIDES_LIBREFERENCE_RIL := true

BOARD_RIL_CLASS := ../../../device/samsung/grandppltedx/ril
#BOARD_CONNECTIVITY_MODULE := conn_soc

# Power HAL
TARGET_POWERHAL_VARIANT := mtk
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power.c

# Wifi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

endif #TWRP

# system properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# SEAndroid
include $(DEVICE_PATH)/sepolicy/sepolicy.mk
BOARD_SECCOMP_POLICY += $(DEVICE_PATH)/seccomp

# Misc
EXTENDED_FONT_FOOTPRINT := true
