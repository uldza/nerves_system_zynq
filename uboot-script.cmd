# Custom U-Boot startup script for Nerves

# It has been simplified to just support the Nerves use cases.
# Most importantly, it will not fallback to the alternate boot location
# like the default script. If you have it installed on the eMMC
# and you want to boot from the SDCard, you must hold down the USER/BOOT
# button. I usually wipe out the eMMC image when working with SDCard
# images to avoid this issue.

echo "Running Nerves U-Boot script"

# Kernel arguments and arguments to erlinit are passed here
# The erlinit arguments can just be tacked on to the end.
# For example, add "-v" to the end to put erlinit into verbose
# mode.

# At the moment booting is done by uEnv.txt file

# Allow the user to override the kernel/erlinit arguments
# via a "uEnv.txt" file in the FAT partition.
if load mmc ${mmcdev}:1 ${loadaddr} uEnv.txt; then
    echo "uEnv.txt found. Overriding environment."
    env import -t -r ${loadaddr} ${filesize}

    # Check if the user provided a set of commands to run
    if test -n $uenvcmd; then
        echo "Running uenvcmd..."
        run uenvcmd
    fi
fi
