#!/bin/bash
duf >! ~/fs.txt
jdupes -rB ~/gallery-dl/twitter
cat ~/fs.txt && duf
