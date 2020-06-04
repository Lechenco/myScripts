#!/bin/bash

xrdb -query | grep -e "$1" | cut -f2
