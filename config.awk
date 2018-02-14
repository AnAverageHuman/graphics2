# define some constants
BEGIN {
    DIMR = 500;
    DIMC = 500;
    split("100 0 102", DEF_COLOR);
    MAGICNUMBER = "P3";
    MAXCOLOR = 255;

    DIRECTIONS[1][""]; split(" 0  1", DIRECTIONS[1]);
    DIRECTIONS[2][""]; split(" 1  0", DIRECTIONS[2]);
    DIRECTIONS[3][""]; split(" 0 -1", DIRECTIONS[3]);
    DIRECTIONS[4][""]; split("-1  0", DIRECTIONS[4]);
}

