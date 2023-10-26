BEGIN{
    FS=","
    PROCINFO["sorted_in"] = "@ind_num_asc"
    acccnt=0
    MIacccnt=0
    multicar=0
    janfebcnt=0
    MImulticar=0
    MIjanfebcnt=0
}
$1 ~ /[0-9]{1,2}/ {acccnt+=1}
$1 == 26 {MIacccnt+=1}
$3 > 1 && $3 ~ /[0-9]{1,2}/ {multicar+=1}
$13 == 1 || $13 == 2 {janfebcnt+=1}
$1 == 26 && $3 > 1 && $3 ~ /[0-9]{1,2}/ {MImulticar+=1}
$1 == 26 && ($13 == 1 || $13 == 2) {MIjanfebcnt+=1}
$1 ~ /[0-9]{1,2}/ {statedd[$1] += $52}
END{
    printf "Multiple Vehicles Proportion: %g\n", multicar/acccnt;
    printf "Jan/Feb Proportion: %g\n", janfebcnt/acccnt;
    printf "MI Multiple Vehicles Proportion: %g\n", MImulticar/MIacccnt;
    printf "MI Jan/Feb Proportion: %g\n", MIjanfebcnt/MIacccnt;
    print "State Code,# DD"
    for (key in statedd) print key "," statedd[key]
}

