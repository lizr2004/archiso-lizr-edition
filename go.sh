#!/usr/bin/env bash
if [ $UID -ne 0 ];then
	sudo $0 $*
	exit
fi 

rm -rf work
./build.sh -N archlinux-lizr-edition -P 'Lizr <oilizr2004@gmail.com>' -v
