# JB Base Install Profile
import archinstall, getpass

is_top_level_profile = True

__description__ = "Minimal sway installation"

# Select a harddrive and a disk password
disk_password = getpass.getpass(prompt='Disk password (won\'t echo): ')
harddrive = archinstall.select_disk(archinstall.all_blockdevices(partitions=False))

# We disable safety precautions in the library that protects the partitions
harddrive.keep_partitions = False

exit(0)

# First, we configure the basic filesystem layout
with archinstall.Filesystem(harddrive, archinstall.GPT) as fs:
    # We create a filesystem layout that will use the entire drive
    # (this is a helper function, you can partition manually as well)
    fs.use_entire_disk(root_filesystem_type='btrfs')

    boot = fs.find_partition('/boot')
    root = fs.find_partition('/')

    boot.format('vfat')

    # Set the flag for encrypted to allow for encryption and then encrypt
    root.encrypted = True
    root.encrypt(password=disk_password)
