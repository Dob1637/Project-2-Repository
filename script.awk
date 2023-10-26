BEGIN{
    FS=","
    acccnt=0
    MIacccnt=0
    multicar=0
    janfebcnt=0
    MImulticar=0
    MIjanfebcnt=0
}
$1 = [0-9]* {acccnt+=1}
$1 = 26 {MIacccnt+=1}
$3 > 1 {multicar+=1}
$13 = 1 || $13 = 2 {janfebcnt+=1}
$1 = 26 && $3 > 1 {MImulticar+=1}
$1 = 26 && ($13 = 1 || $13 = 2) {MIjanfebcnt+=1}
END{

}

