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

function drawline(display, p1, p2, color) {
    m = (p2["y"] - p1["y"]) / (p2["x"] - p1["x"]);
    printf("%s", m) >> "/dev/stderr"
    if (m > 0 && m < 1) {
        if (p1["x"] > p2["x"]) { # octant I
            octant1line(display, p2, p1, color);
        } else { #octant V
            octant1line(display, p1, p2, color);
        }
    } else if (m >= 1) {
        if (p1["x"] > p2["x"]) { # octant II
            octant2line(display, p2, p1, color);
        } else { # octant VI
            octant2line(display, p1, p2, color);
        }
    }
}

