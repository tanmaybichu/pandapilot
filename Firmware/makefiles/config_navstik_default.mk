#
# Makefile for the navstik_default configuration
#

#
# Use the configuration's ROMFS.
#
ROMFS_ROOT	 = $(NAVSTIK_BASE)/ROMFS/navstik

#
# Board support modules
#
MODULES		+= drivers/device
MODULES		+= drivers/stm32
MODULES		+= drivers/stm32/adc
MODULES		+= drivers/led
MODULES		+= drivers/boards/navstik
MODULES		+= drivers/navstik
#MODULES		+= drivers/ardrone_interface
MODULES		+= drivers/bmp180
MODULES		+= drivers/mpu60x0
MODULES		+= drivers/hmc5883
MODULES		+= drivers/gps
#MODULES		+= drivers/hil
#MODULES		+= drivers/hott/hott_telemetry
#MODULES		+= drivers/mkblctrl
#MODULES		+= drivers/md25
MODULES		+= modules/sensors

#
# System commands
#
#MODULES		+= systemcmds/eeprom
MODULES		+= systemcmds/bl_update
MODULES		+= systemcmds/boardinfo
MODULES		+= systemcmds/i2c
MODULES		+= systemcmds/mixer
MODULES		+= systemcmds/param
MODULES		+= systemcmds/perf
MODULES		+= systemcmds/preflight_check
MODULES		+= systemcmds/pwm
MODULES		+= systemcmds/reboot
MODULES		+= systemcmds/top
MODULES		+= systemcmds/tests

#
# General system control
#
MODULES		+= modules/commander
MODULES		+= modules/mavlink
MODULES		+= modules/mavlink_onboard
#MODULES		+= modules/gpio_led

#
# Estimation modules (EKF / other filters)
#
MODULES		+= modules/attitude_estimator_ekf
MODULES		+= modules/attitude_estimator_so3_comp
#MODULES		+= modules/position_estimator_mc
MODULES		+= modules/position_estimator
MODULES		+= modules/att_pos_estimator_ekf

#
# Vehicle Control
#
MODULES		+= modules/fixedwing_backside
MODULES		+= modules/fixedwing_att_control
MODULES		+= modules/fixedwing_pos_control
MODULES		+= modules/multirotor_att_control
MODULES		+= modules/multirotor_pos_control

#
# Logging
#
MODULES		+= modules/sdlog2

#
# Library modules
#
MODULES		+= modules/systemlib
MODULES		+= modules/systemlib/mixer
MODULES		+= modules/mathlib
MODULES		+= modules/controllib
MODULES		+= modules/uORB

#
# Libraries
#
LIBRARIES	+= modules/mathlib/CMSIS

#
# Demo apps
#
#MODULES		+= examples/math_demo
# Tutorial code from
# https://pixhawk.ethz.ch/px4/dev/hello_sky
#MODULES		+= examples/px4_simple_app

# Tutorial code from
# https://pixhawk.ethz.ch/px4/dev/daemon
#MODULES		+= examples/px4_daemon_app

# Tutorial code from
# https://pixhawk.ethz.ch/px4/dev/debug_values
#MODULES		+= examples/px4_mavlink_debug

# Tutorial code from
# https://pixhawk.ethz.ch/px4/dev/example_fixedwing_control
MODULES			+= examples/fixedwing_control

#
# Transitional support - add commands from the NuttX export archive.
#
# In general, these should move to modules over time.
#
# Each entry here is <command>.<priority>.<stacksize>.<entrypoint> but we use a helper macro
# to make the table a bit more readable.
#
define _B
	$(strip $1).$(or $(strip $2),SCHED_PRIORITY_DEFAULT).$(or $(strip $3),CONFIG_PTHREAD_STACK_DEFAULT).$(strip $4)
endef

#                  command                 priority                   stack  entrypoint
BUILTIN_COMMANDS := \
	$(call _B, sercon,                 ,                          2048,  sercon_main                ) \
	$(call _B, serdis,                 ,                          2048,  serdis_main                ) \
	$(call _B, sysinfo,                ,                          2048,  sysinfo_main               )
