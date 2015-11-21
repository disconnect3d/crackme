CC=gcc
CFLAGS=-Wall -Wextra -Wpedantic -std=c11
CXX=g++
CXXFLAGS=-Wall -Wextra -Wpedantic -std=c++11





























all:
	mkdir -p crackme

	@chmod 755 crackme

	@# LEVEL 0 - warmup
	@$(CC) $(CFLAGS) -DWELCOME="\"cr4ckm3 level 0. enjoy\"" -DPASS="\"filterme\"" src/warmup.c -o crackme/warmup

	@# LEVEL 1 - filterme
	@# TODO / FIXME: filterme level should not have hardcoded password for next level
	@$(CC) $(CFLAGS) -DWELCOME="\"cr4ckm3 level 1. enjoy\"" src/filterme.c -o crackme/filterme
	
	@# LEVEL 2 - fd
	@$(CC) $(CFLAGS) -DWELCOME="\"cr4ckm3 level 2. enjoy\"" -DPASS="\"fork\"" src/fd.c -o crackme/fd

	@# LEVEL 3 - fork
	@$(CC) $(CFLAGS) src/fork.c -o crackme/fork
	@echo "from __future__ import print_function" > crackme/fork.py
	@echo "print('cr4ckm3 level 3. enjoy')" >> crackme/fork.py
	@echo "print('What if I tell you that I am a child?')" >> crackme/fork.py
	@echo "print('...and that you can read me?')" >> crackme/fork.py
	@echo "# password: sanitizeme.cpp" >> crackme/fork.py

	@# LEVEL 4 - sanitizeme.cpp
	@# Because of implementation of _create_sanitizeme.cpp.py, password returned must be of 9 characters!
	@WELCOME="cr4ckm3 level 4. enjoy" PASS="summarize" python3 src/_create_sanitizeme.cpp.py > crackme/sanitizeme.cpp

	@# LEVEL 5 - summarize
	@# Because of the task in LEVEL 5 - the next level has password `nanosleep`
	@$(CXX) $(CXXFLAGS) -DWELCOME="\"cr4ckm3 level 5. enjoy\"" src/summarize.cpp -o crackme/summarize

	@# LEVEL 6 - nanosleep
	@$(CXX) $(CXXFLAGS) -Wno-unused-variable -pg -DWELCOME="\"cr4ckm3 level 6. enjoy\"" -DPASS="jumper" src/nanosleep.cpp -o crackme/nanosleep

	@# LEVEL 7 - jumper
	@# The next password is hardcoded inside jumper - it is "kkthxbye".
	@$(CXX) $(CXXFLAGS) -DWELCOME="\"cr4ckm3 level 7. enjoy\"" src/jumper.cpp -o crackme/jumper
	
	@# LEVEL 8 - this is just an end
	@$(CXX) $(CXXFLAGS) src/kkthxbye.cpp -o crackme/kkthxbye
	
	@chmod 111 crackme/*
	@chmod 555 crackme/warmup
	@chmod 555 crackme/filterme
	@chmod 744 crackme/*.py
	@chmod 555 crackme/sanitizeme.cpp
	@chmod 555 crackme/nanosleep
	@chmod 555 crackme/jumper

	@chmod 111 crackme
	
	@echo "Cr4ckm3 made by Dominik Czarnota & Dariusz Zielinski"
	@echo "for univeristy classes at AGH University of Science and Technology in Cracow"
	@echo "----------------------------------------------------------------------------"
	@echo "The exercises are pretty easy, you need to use tools like strings, strace, gprof, gdb or g++/clang++ sanitizers"
	@echo "The sanitizers exercise was tested on g++ 5.2 or clang++-3.5"
	@echo "If you want to play, here are some rules:"
	@echo " * do not look into makefile or src sources"
	@echo " * do not change chmods"
	@echo "Start from ./crackme/warmup"
	@echo "Each password is a next file in crackme"
	@echo "Good luck, have fun!"

clean:
	chmod 755 crackme
	rm -rf crackme
