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

function fillcolor(display, x, y, color, boundcolor,   d, _x, _y) {
    for (d in DIRECTIONS) {
        _x = x + DIRECTIONS[d][1];
        _y = y + DIRECTIONS[d][2];

        if (_x > 0 && _x <= DIMC && _y > 0 && _y <= DIMC &&
            ! equalpixels(display[_x][_y], boundcolor)) {
            plotpoint(display, _x, _y, color);
            fillcolor(display, _x, _y, color, boundcolor);
        }
    }
}

