#!/bin/bash

RESTORE_DIR="$1"

echo "---"
echo RESTORE_DIR=$RESTORE_DIR
echo "---"
cd private
for HASH_HISTORYFILE in $(ls *.history); do
  HASH=$(echo $HASH_HISTORYFILE | sed 's/.history//')
  HASH_SRC=$(cat ${HASH}.src)
  echo "Restoring $HASH_SRC"
  for TARBALL in $(cat $HASH_HISTORYFILE); do
    echo "    📦 ➡ $TARBALL"
    tar -C "$RESTORE_DIR" --listed-incremental=/dev/null -xzf $TARBALL
  done
done

echo "---"
echo OK
