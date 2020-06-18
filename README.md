# tarbackup

A simplistic backup tool using tar balls. No encryption of any kind is supported.

## How to Use

Copy the contents of this script into the directory where you want your backup to be stored.

### Edit `filenames`

Edit `filenames` to manually list all files you want to include in the backup. Empty lines and lines starting with `#` are ignored.

All backed up and restored files are always relative to the root directory `/`. Therefore, missing leading `/` characters will be automatically added.

### Create a backup
Use the default and `full` targets to create a backup.

```
## create an incremental backup
## only modified files since last backup are added.
make

## remove all previous incremental
## backups and create a new one.
make full
```

Backup files will be created in the `private` directory.

### Restore the current backup

Run `make restore` to restore the backup.

A file called `backup.log` will be created in every run, showing which source directories and hash associations.
