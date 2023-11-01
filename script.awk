BEGIN{
    FS=","
    gvscore = 0
    gvwin = 0
    gamecount = 0
}

$3 == "W" && $7 == "yes" {gvwin += 1}
$4 ~ /[0-9]{1,2}/ && $2 == "soccer(W)" {gvscore += $4}
$2 == "soccer(W)" &&  ($3 == "W" || $3 == "L") {gamecount += 1}

END{
    printf "Avg GVSU score = %g\n", (gvscore/gamecount);
    printf "Count GVSU home wins = %g\n", gvwin;
}

