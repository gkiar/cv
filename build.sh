#!/bin/bash

cd ${1}

lualatex gkiarcv.tex
biber gkiarcv
lualatex gkiarcv.tex
