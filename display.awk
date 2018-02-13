# displays are 3D arrays: x, y, (R, G, B)

function gendisplay(display,   i, j) {
    for (i = 0; i < DIMR; i++) {
        for (j = 0; j < DIMC; j++) {
            display[i][j]["r"] = DEF_COLOR[1];
            display[i][j]["g"] = DEF_COLOR[2];
            display[i][j]["b"] = DEF_COLOR[3];
        }
    }
}

function dumpdisplay(display,   i, j) {
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

function plotpoint(display, x, y, color,   i) {
    for (i in color) {
        display[x][y][i] = color[i];
    }
}

function display2ppm(display) {
    printf("%s %d %d %d\n", MAGICNUMBER, DIMR, DIMC, MAXCOLOR);
    dumpdisplay(display);
}

function equalpixels(p1, p2) {
    return p1["r"] == p2["r"] && p1["g"] == p2["g"] && p1["b"] == p2["b"];
}

function fillcolor(display, color, begcolor, endcolor,   _fill, i, j) {
    for (i = 0; i < DIMR; i++) {
        _fill = 0;
        for (j = 0; j < DIMC; j++) {
            if (! _fill && equalpixels(display[i][j], begcolor)) {
                _fill = 1;
            } else if (_fill && equalpixels(display[i][j], endcolor)) {
                _fill = 0;
            } else if (_fill) {
                plotpoint(display, i, j, color);
            }
        }
    }
}

