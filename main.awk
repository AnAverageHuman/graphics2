#!/usr/bin/gawk -f
@include "config.awk"
@include "display.awk"
@include "line.awk"

BEGIN {
    color["r"] = 100;
    color["g"] = 200;
    color["b"] = 100;

    lines[ 1][1][""]; split("425 250", lines[ 1][1]); # point 1 of line 1
    lines[ 1][2][""]; split("175 400", lines[ 1][2]); # point 2 of line 1
    lines[ 2][1][""]; split("425 250", lines[ 2][1]);
    lines[ 2][2][""]; split("175 100", lines[ 2][2]);
    lines[ 3][1][""]; split("125 400", lines[ 3][1]);
    lines[ 3][2][""]; split("175 400", lines[ 3][2]);
    lines[ 4][1][""]; split("125 100", lines[ 4][1]);
    lines[ 4][2][""]; split("175 100", lines[ 4][2]);
    lines[ 5][1][""]; split("125 400", lines[ 5][1]);
    lines[ 5][2][""]; split(" 75 350", lines[ 5][2]);
    lines[ 6][1][""]; split("125 100", lines[ 6][1]);
    lines[ 6][2][""]; split(" 75 150", lines[ 6][2]);
    lines[ 7][1][""]; split(" 75 300", lines[ 7][1]);
    lines[ 7][2][""]; split(" 75 350", lines[ 7][2]);
    lines[ 8][1][""]; split(" 75 150", lines[ 8][1]);
    lines[ 8][2][""]; split(" 75 200", lines[ 8][2]);
    lines[ 9][1][""]; split(" 75 300", lines[ 9][1]);
    lines[ 9][2][""]; split("150 250", lines[ 9][2]);
    lines[10][1][""]; split(" 75 200", lines[10][1]);
    lines[10][2][""]; split("150 250", lines[10][2]);

    gendisplay(THEDISPLAY);

    for (i in lines) {
        printf("line %2s with ", i) >> "/dev/stderr";
        drawline(THEDISPLAY, lines[i][1], lines[i][2], color);
    }

    display2ppm(THEDISPLAY);
    exit;
}

