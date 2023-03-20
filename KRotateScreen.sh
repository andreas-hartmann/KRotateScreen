#!/bin/bash

output=$(kscreen-doctor --json)
rotation=$(echo "$output" | jq '.outputs[] | select(.name=="LVDS-1") | .rotation')

case "$rotation" in
  "1")
    ROTATION="right"
    ;;
  "2")
    ROTATION="normal"
    ;;
  "4")
    ROTATION="left"
    ;;
  "8")
    ROTATION="inverted"
    ;;
  *)
    echo "Invalid rotation value: $rotation"
    exit 1
    ;;
esac

kscreen-doctor "output.LVDS-1.rotation.$ROTATION"
