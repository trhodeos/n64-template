WINE := /usr/local/bin/wine
EMULATOR := /Applications/RetroArch.app/Contents/MacOS/RetroArch -L /Applications/RetroArch.app/Contents/Resources/cores/parallel_n64_libretro.dylib

GAME_NAME := changeme
ROM_NAME := $(GAME_NAME).n64

.DEFAULT_GOAL := run_on_emulator

$(ROM_NAME):
	export GAME_NAME="$(GAME_NAME)"; $(WINE) cmd /c compile.bat

run_on_emulator: $(ROM_NAME)
	$(EMULATOR) $(ROM_NAME)

run_on_device: $(ROM_NAME)
	./deploy.sh $(ROM_NAME)

clean:
	rm *.o *.n64 *.out
