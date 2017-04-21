#! /bin/bash

# make directories if they don't exist
	mkdir -p outputs
	mkdir -p inputs

# create input file
	printf "Lorem ipsum dolor sit amet 1234567890\n\n\n" > inputs/input-file.txt

# Just test with empty content
	NUM='1'
	OLD=''
	NEW=''
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test with empty replaced
	NUM='2'
	OLD=''
	NEW='emptystring1'
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test for simple word replacement
	NUM='3'
	OLD='Lorem'
	NEW='Borem'
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test for basic regex
	NUM='5'
	OLD='[0-9]'
	NEW='digit'
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test replacing entire contents
	NUM='6'
	OLD='Lorem ipsum dolor sit amet 1234567890'
	NEW='nothing1'
	cat inputs/input-file.txt | ./replace.exe "$OLD" $NEW > outputs/out$NUM.txt

# Test with illegal new string
	NUM='7'
	OLD='Lorem'
	NEW='BoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBorem'
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test with illegal old string
	NUM='8'
	NEW='Lorem'
	OLD='BoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBoremBorem'
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test with more regex
	NUM='9'
	OLD="[L][o].*[m]"
	NEW="STRING"
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Test with strange patterns and newlines
	NUM='10'
	OLD="@@@@@@@@@@@@@@"
	NEW="STRING"
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# Lazy match regex
	NUM='11'
	OLD="[0-9].*?[0-9]"
	NEW="!@@#$%^&*()_+"
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# More random junk
	NUM='12'
	OLD="%%%%%%%"
	NEW="/~``"
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt

# More random regex junk
	NUM='13'
	OLD="^[A-C].*$"
	NEW="@@@@@@@@@@@@@@@@@@@@@@@@@@"
	cat inputs/input-file.txt | ./replace.exe $OLD $NEW > outputs/out$NUM.txt
