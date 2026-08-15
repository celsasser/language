# A makefile replacement for the qbld script.
#
# Staleness is decided by comparing docs/<name>.html against <name>.qmd rather
# than by asking git what is modified. Committed-but-unrendered files rebuild
# correctly, and touched-but-unchanged files do not.
#
# Usage: make -f qbld.mak [target]
#
# Known gap: `mods` renders files individually, which leaves the sidebar and
# search index reflecting the previous build. Use `site` after adding, removing,
# or retitling a document.

QMD  := $(wildcard *.qmd)
HTML := $(patsubst %.qmd,docs/%.html,$(QMD))
DEPS := $(wildcard _quarto.yml _variables.yml)	# intentionally leave styles.css out

.PHONY: mods site clean scrub help
.DEFAULT_GOAL := help

mods: $(HTML)          ## Build only what changed

docs/%.html: %.qmd $(DEPS)
	quarto render $<

site:                 ## Full site build (refreshes nav + search index)
	quarto render

clean:                ## Remove rendered output
	-rm -rf docs *.quarto_ipynb

scrub: clean          ## Also drop Quarto's caches
	-rm -rf .quarto

help:                 ## Show this help
	@grep -E '^[a-z-]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/\t/'
