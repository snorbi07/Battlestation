#!/bin/bash

CURR_LANG="$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')"
US="us"
HU="hu"

if [ $CURR_LANG == $US ]
then
	setxkbmap hu
elif [ $CURR_LANG == $HU ]
then
	setxkbmap us
else
	setxkbmap us
fi
