function octant1line(display, p1, p2, color) {
    x = p1["x"];
    y = p1["y"];
    A = p2["y"] - p1["y"];
    B = p1["x"] - p2["x"]; # dirty optimization saves a step
    d = 2 * A + B;

    while (x <= p2["x"]) {
        plotpoint(display, x++, y, color);
        d += 2 * A;
        if (d > 0) {
            y++;
            d += 2 * B;
        }
    }
}

function octant2line(display, p1, p2, color) {
    x = p1["x"];
    y = p1["y"];
    A = p2["y"] - p1["y"];
    B = p1["x"] - p2["x"]; # dirty optimization saves a step
    d = A + 2 * B;

    while (y <= p2["y"]) {
        plotpoint(display, x, y++, color);
        d += 2 * B;
        if (d < 0) {
            x++;
            d += 2 * A;
        }
    }
}

function octant3line(display, p1, p2, color) {
    x = p1["x"];
    y = p1["y"];
    A = p2["y"] - p1["y"];
    B = p1["x"] - p2["x"]; # dirty optimization saves a step
    d = A - 2 * B;

    while (y >= p2["y"]) {
        plotpoint(display, x, y--, color);
        d -= 2 * B;
        if (d > 0) {
            x++;
            d += 2 * A;
        }
    }
}

function octant4line(display, p1, p2, color) {
    x = p1["x"];
    y = p1["y"];
    A = p2["y"] - p1["y"];
    B = p1["x"] - p2["x"]; # dirty optimization saves a step
    d = 2 * A - B;

    while (x <= p2["x"]) {
        plotpoint(display, x++, y, color);
        d += 2 * A;
        if (d < 0) {
            y--;
            d -= 2 * B;
        }
    }
}

function drawline(display, p1, p2, color) {
    if (p1["x"] > p2["x"]) {
        drawline(display, p2, p1, color);
        return;
    }

    m = (p2["y"] - p1["y"]) / (p2["x"] - p1["x"]);
    printf("slope %s\n", m) >> "/dev/stderr"
    if (m > 0 && m < 1) { # octant I, V
        octant1line(display, p1, p2, color);
    } else if (m >= 1) { # octant II, IV
        octant2line(display, p1, p2, color);
    } else if (m <= -1) { # octant III, octant VII
        octant3line(display, p1, p2, color);
    } else if (m < 0 && m > -1) { # octant IV, VIII
        octant4line(display, p1, p2, color);
    }
}

