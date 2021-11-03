# paths
PREFIX = /usr/
LOCPREFIX = $$HOME/.local/share
MANPREFIX = $(PREFIX)/share/man

# Compiler
JAVAC = javac

# Files
MEDIA = src/*.png src/*.wav
SRC = $(shell find src -name "*.java")

# Java Metadata
ENTRYPNT = com.superliminal.magiccube4d.MC4DSwing
JAR = mc4d.jar

all: mediafiles mc4d mkexe


.PHONY: mc4d mkexe

mc4d: 
	javac -d bin $(SRC);
	sed mc4d.sh -e 's,%JARFILE,$(LOCPREFIX)/mc4d/$(JAR),' \
		> mc4d;

mkexe:
	cd bin; jar cfe ../$(JAR) $(ENTRYPNT) *; cd ..;

mediafiles:
	mkdir -p bin;
	cp $(MEDIA) bin;

install:
	mkdir -p $(PREFIX)/bin;
	cp -f mc4d $(PREFIX)bin/mc4d;
	chmod 755 $(PREFIX)bin/mc4d;
	# mkdir -p $(LOCPREFIX)/mc4d;
	# cp -f $(JAR) $(LOCPREFIX)/mc4d/$(JAR);
