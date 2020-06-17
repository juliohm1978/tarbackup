# tarbackup

A simplistic backup tool using tar balls. No encryption of any kind is supported.

## TODO

* Restore script

## How to use

Copy the contents of this script into the directory where you want your backup to be stored.

Edit `filenames` to manually list all files you want to include in the backup.

Run `make full` to remove all previous backued up files and create a new full backup.

Run `make` to create an incremental backup. Only modified/created files since the last backup will be included.

Backup files will be created in the `private` directory.

A file called `backup.log` will be created in every run, showing which source directories and hash associations.
