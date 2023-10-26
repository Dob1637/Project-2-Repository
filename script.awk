BEGIN{
    FS=","
    acccnt=0
    MIacccnt=0
    multicar=0
    janfebcnt=0
    MImulticar=0
    MIjanfebcnt=0
    DD1=0
    DD2=0
    DD4=0
    DD5=0
    DD26=0
}
$1 ~ /[0-9]{1,2}/ {acccnt+=1}
$1 == 26 {MIacccnt+=1}
$3 > 1 && $3 ~ /[0-9]{1,2}/ {multicar+=1}
$13 == 1 || $13 == 2 {janfebcnt+=1}
$1 == 26 && $3 > 1 && $3 ~ /[0-9]{1,2}/ {MImulticar+=1}
$1 == 26 && ($13 == 1 || $13 == 2) {MIjanfebcnt+=1}
$1 == 1 {DD1+=$52}
$1 == 2 {DD2+=$52}
$1 == 4 {DD4+=$52}
$1 == 5 {DD5+=$52}
$1 == 26 {DD26+=$52}
END{
    printf "Multiple Vehicles Proportion: %f\n", multicar/acccnt;
    printf "Jan/Feb Proportion: %f\n", janfebcnt/acccnt;
    printf "MI Multiple Vehicles Proportion: %f\n", MImulticar/MIacccnt;
    printf "MI Jan/Feb Proportion: %d\n", MIjanfebcnt/MIacccnt;
    print "State Code,# DD"
    printf "26,%d\n", DD26;
    printf "4,%d\n", DD4;
    printf "5,%d\n", DD5;
    printf "1,%d\n", DD1;
    printf "2,%d\n", DD2;
}

