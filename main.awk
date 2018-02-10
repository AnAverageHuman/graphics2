#!/usr/bin/gawk -f
@include "config.awk"
@include "display.awk"
@include "line.awk"

BEGIN {
    # srand();
    p1["x"] = 0;
    p1["y"] = 0;
    p2["x"] = 300;
    p2["y"] = 150;
    color["r"] = 100;
    color["g"] = 200;
    color["b"] = 100;

    gendisplay(THEDISPLAY);
    drawline(THEDISPLAY, p1, p2, color);
    display2ppm(THEDISPLAY);

    exit;
}

