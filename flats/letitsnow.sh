#!/bin/bash
# 
# letitsnow.sh FILENAME NUMBER TYPE FILE
# FILENAME - filename prefix
# NUMBER - how many files to generale
# TYPE - OpenSCAD output type (stl, off, amf, csg, dxf, svg, png, echo, ast, term, nef3, nefdbg)
# FILE - input scad file

sn=($(seq -w 1 "$2"))

for n in "${sn[@]}"
do
		openscad-nightly -o "$1"'_'"$n"'.'"$3" "$4"
done
