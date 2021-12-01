#!/bin/bash
mkdir new_folder

# Зайти в папку
cd new_folder

# Создать 3 папки
mkdir folder_1 folder_2 folder_3

# Зайти в любую папку
cd folder_1

# Создать 5 файлов (3 txt, 2 json)
touch file_1.txt file_2.txt file_3.txt file_4.json file_5.json

# Создать 3 папки
mkdir inner_folder_1 inner_folder_2 inner_folder_3

# Вывести список содержимого папки
echo "$(ls -la)"

# переместить любые 2 файла, которые вы создали, в любую другую папку
mv file_4.json file_5.json inner_folder_1

$SHELL