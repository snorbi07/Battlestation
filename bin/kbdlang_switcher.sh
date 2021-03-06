#!/bin/bash

CURR_LANG="$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')"
US="us"
HU="hu"

if [ $CURR_LANG == $US ]
then
	setxkbmap -layout hu -option ctrl:nocaps
elif [ $CURR_LANG == $HU ]
then
	setxkbmap -layout us -option ctrl:nocaps
else
	setxkbmap -layout us -option ctrl:nocaps
fi
