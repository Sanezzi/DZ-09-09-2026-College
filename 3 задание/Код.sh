#!/bin/bash
> report.txt
for file in lab_data/*
do
  echo "Файл: $file" >> report.txt
  echo "Размер: $(stat -c "%s" "$file") байт" >> report.txt
  echo "Изменен: $(stat -c "%y" "$file")" >> report.txt
  echo "Тип: $(stat -c "%F" "$file")" >> report.txt
  echo >> report.txt
done

for file in lab_data/*
do
  echo "$(stat -c "%s" "$file") $file"
done | sort -n | tail -3
