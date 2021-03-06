#!/bin/bash

# require functions
. ./common.sh

# INIT
echo -e "NETHUNTER LINUX FLASH (OEM UNLOCK)\n"
echo -e "NOTE: THIS WILL FACTORY RESET THE DEVICE (15 secs to cancel using 'ctrl + c')\n"
sleep 15
echo -e "CHECKING PRE-REQUISITES\n"

doCommonChecks

echo -e "CHECKING PRE-REQUISITES ...DONE\n"
sleep 3

echo -e "Rebooting into bootloader"
adb reboot bootloader
sleep 5
echo -e "Rebooting into bootloader ...DONE\n"

echo -e "Starting OEM UNLOCK"
echo -e "This needs you interaction. Check phone screen."
fastboot oem unlock
fastboot flashing unlock
echo -e "OEM UNLOCK ...DONE\n"

echo -e "Rebooting the phone"
fastboot continue
echo -e "Rebooting the phone ...DONE\n"

# END

echo -e "It can take a bit to boot up, dont worry. ^^\n"
echo -e "You will need to enable developer options and USB debugging again.\n"

echo -e "You can flash a stock rom using stockFlash.sh (Not needed if you are in latest android version)"
echo -e "or continue flashing TWRP && superSU && Kali Nethunter using twrpFlash.sh script\n"
exit
