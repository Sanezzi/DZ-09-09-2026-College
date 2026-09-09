#!/bin/bash
source=$1
target=$2
force=$3

if [ ! -f "$source" ]
then
  echo "Файл не найден"
  exit 1
fi

if [ ! -r "$source" ]
then
  echo "Нет прав на чтение"
  exit 1
fi

if [ -f "$target" ] && [ "$force" != "-f" ]
then
  echo "Файл уже существует"
  exit 1
fi

> "$target"
while read line
do
  echo "$line" >> "$target"
done < "$source"

size1=$(stat --format="%s" "$source")
size2=$(stat --format="%s" "$target")

echo "$size1"
echo "$size2"

if [ "$size1" -eq "$size2" ]
then
  echo "Размеры совпадают"
else
  echo "Размеры не совпадают"
fi
