#!/bin/bash

i3-msg "workspace ter; split v; append_layout ~/layts/term-ranger-term.json"
xfce4-terminal --role ter &
xfce4-terminal --role ter &
xfce4-terminal --role ranger -x ranger &
