.PHONY: all
all: README.md

README.md: guessinggame.sh makefile
	@printf '# Guessing Game\n\n' > $@
	@printf 'Generated on: %s\n\n' "$$(date '+%Y-%m-%d %H:%M:%S %z')" >> $@
	@printf 'Lines in `guessinggame.sh`: %s\n' "$$(wc -l < guessinggame.sh)" >> $@
