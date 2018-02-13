function octant1line(display, p1, p2, color,   d) {
    d = 2 * A + B;

    while (x <= p2[1]) {
        plotpoint(display, x++, y, color);
        d += 2 * A;
        if (d > 0) {
            y++;
            d += 2 * B;
        }
    }
}

function octant2line(display, p1, p2, color,   d) {
    d = A + 2 * B;

    while (y <= p2[2]) {
        plotpoint(display, x, y++, color);
        d += 2 * B;
        if (d < 0) {
            x++;
            d += 2 * A;
        }
    }
}

function octant3line(display, p1, p2, color,   d) {
    d = A - 2 * B;

    while (y >= p2[2]) {
        plotpoint(display, x, y--, color);
        d -= 2 * B;
        if (d > 0) {
            x++;
            d += 2 * A;
        }
    }
}

function octant4line(display, p1, p2, color,   d) {
    d = 2 * A - B;

    while (x <= p2[1]) {
        plotpoint(display, x++, y, color);
        d += 2 * A;
        if (d < 0) {
            y--;
            d -= 2 * B;
        }
    }
}

function drawline(display, p1, p2, color,   m) {
    x = p1[1];
    y = p1[2];
    A = p2[2] - p1[2];
    B = p1[1] - p2[1]; # dirty optimization saves a step

    if (p1[1] > p2[1]) {
        drawline(display, p2, p1, color);
        return;
    }

    m = (B == 0) ? 9999 : (p2[2] - p1[2]) / (p2[1] - p1[1]);
    printf("slope % g\n", m) >> "/dev/stderr"
    if (m >= 0 && m < 1) { # octant I, V
        octant1line(display, p1, p2, color);
    } else if (m >= 1) { # octant II, IV
        octant2line(display, p1, p2, color);
    } else if (m <= -1) { # octant III, octant VII
        octant3line(display, p1, p2, color);
    } else if (m < 0 && m > -1) { # octant IV, VIII
        octant4line(display, p1, p2, color);
    }
}

