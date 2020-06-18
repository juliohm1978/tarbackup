DST=$(PWD)/private

backup:
	sudo bash backup.sh "$(DST)" 2>&1 > backup.log

full:
	sudo bash backup.sh "$(DST)" full 2>&1 > backup.log

restore:
	sudo bash restore.sh "$(PWD)/"
