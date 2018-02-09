#!/usr/bin/gawk -f
@include "config.awk"
@include "display.awk"

# initialize the display

BEGIN {
    # srand();

    gendisplay(THEDISPLAY);
    dumpdisplay(THEDISPLAY);
    exit;
}

