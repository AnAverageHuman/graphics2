#!/usr/bin/gawk -f
@include "config.awk"

# displays are 3D arrays: x, y, (R, G, B)

function gendisplay(display) {
    for (i = 0; i < DIMR; i++) {
        for (j = 0; j < DIMC; j++) {
            display[i][j]["r"] = DEF_COLOR[1];
            display[i][j]["g"] = DEF_COLOR[2];
            display[i][j]["b"] = DEF_COLOR[3];
        }
    }
}

function dumpdisplay(display) {
    for (i = 0; i < DIMR; i++) {
        for (j = 0; j < DIMC; j++) {
            printf("%d %d %d ",
                   display[i][j]["r"],
                   display[i][j]["g"],
                   display[i][j]["b"]);
        }
        printf("\n");
    }
}

function display2ppm(display) {
    printf("%s %d %d %d\n", MAGICNUMBER, DIMR, DIMC, MAXCOLOR);
    dumpdisplay(display);
}

