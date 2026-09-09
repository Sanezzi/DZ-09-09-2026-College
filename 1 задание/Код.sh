#!/bin/bash
mkdir lab_data
for i in $(seq 1 10)
do
  echo "Строка $i" >> lab_data/small.txt
done
for i in $(seq 1 500)
do
  echo "Строка $i" >> lab_data/medium.txt
done
for i in $(seq 1 10000)
do
  echo "Строка $i" >> lab_data/large.txt
done
stat --format="%s" lab_data/small.txt
stat --format="%s" lab_data/medium.txt
stat --format="%s" lab_data/large.txt
