#!/usr/bin/env bash
if [ $UID -ne 0 ];then
	sudo $0 $*
	exit
fi 

if [ $1 = 'clean' ];then
	rm -rf work
fi
./build.sh -N archlinux-lizr-edition -P 'Lizr <oilizr2004@gmail.com>' -v
