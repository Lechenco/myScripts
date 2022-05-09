#!/bin/bash

pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) |  grep -Eo '[0-9][0-9]%' | tail -n 1
