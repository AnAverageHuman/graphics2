OUTFILE ?= image.ppm
CLEANTARGETS := $(OUTFILE)

ifneq ($(V),)
	SHELL += -x
	Q = true ||
endif

.PHONY: all clean

all: $(OUTFILE)

clean:
	@$(foreach i, $(CLEANTARGETS), $(Q)echo "  CLEAN		$(i)"; rm -rf $(i);)

$(OUTFILE):
	@$(Q)echo "  PPM		$(OUTFILE)"
	@awk -f main.awk > $(OUTFILE)

