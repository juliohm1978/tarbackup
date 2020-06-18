## to restore removing files that no longer exist
## after the backup was created, use --listed-incremental=/dev/null

DST="$1"
TYPE="$2"

if [[ "$DST" == "" || "$DST" == "/" ]]; then
  echo "ERROR Invalid DST=$DST"
  exit 1
fi

if [[ "$TYPE" == "full" ]]; then
  echo "🗑️  Removing all previous archives..."
  rm -fr $DST/*
fi

TIMESTAMP_ATUAL=$(date +'%Y%m%d-%H%M%S')
COUNT=0
WORKDIR=$(pwd)

mkdir -p "$DST"
echo "📂 Destination: $DST"
while IFS= read -r line
do
  if [[ "$line" != "" && $line != \#* ]]; then
    echo "---"
    BACKUP_HASH=$(echo "$line" | md5sum - | awk '{print $1}')
    BACKUP_FILE="${BACKUP_HASH}.${TIMESTAMP_ATUAL}.${COUNT}.tgz"
    BACKUP_SNAR="${BACKUP_HASH}.snar"
    echo "📂 /${line}"
    echo "🤪 ${BACKUP_SNAR}"
    echo "📦 ${BACKUP_FILE}"
    echo "${line}"        >  "${DST}/${BACKUP_HASH}.src"
    echo "${BACKUP_FILE}" >> "${DST}/${BACKUP_HASH}.history"

    tar -C / --listed-incremental=$DST/${BACKUP_SNAR} -czf "$DST/${BACKUP_FILE}" "$line"
    let COUNT=$COUNT+1
  fi
done < "${WORKDIR}/filenames"

echo OK
