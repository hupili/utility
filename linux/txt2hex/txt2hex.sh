#!/bin/bash

echo -e -n "0x"
cat | xxd -p | tr -d ' ' | tr -d '\n'

exit 0
