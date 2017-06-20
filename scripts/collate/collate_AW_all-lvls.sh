#!/bin/bash
printf "rotation\tlocation\toffset\temulate\tpreclude\tyear\tDOY\tsoil:AW/150cm/LEQ.value\tsoil:water_depth/profile/LEQ.value\n" > AW@243_all.dat

find . -name "AW@243.dat"|while read fname; do
    IFS='/' read -r -a dirs <<< "$fname"
    printf "${dirs[1]}\t" >> AW@243_all.dat #rotation
    printf "${dirs[2]}\t" >> AW@243_all.dat #location
    printf "${dirs[3]}\t" >> AW@243_all.dat #offset
    printf "${dirs[4]}\t" >> AW@243_all.dat #emulate
    printf "${dirs[5]}\t" >> AW@243_all.dat #preclude
    sed -n '2p' $fname >> AW@243_all.dat
done