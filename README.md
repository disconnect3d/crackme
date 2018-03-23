# Cr4ckm3 game

Cr4ckm3 is a small cracking game in which you search for password by using "unusual" [debugging] tools.

The exercises are pretty easy, you need to use tools like `strings`, `strace`, `gdb`, `gprof` or `g++`/`clang++` sanitizers.

# Docker build instructions

To make sure you have all the right versions of all the required tools, there is a Docker build file. To build the Docker image and play the game, run the following:
```bash
docker build -t crackme .
docker run -it crackme
cd crackme/
ls # you'll see all the challenges here
```

# Rules

* do not look into makefile or src sources
* do not change chmods


# How to play

Just clone the repository and fire `make` - it will build up a `crackme` directory. The first level is called `warmup`, so just fire `./crackme/warmup`. Hack it with `strace` or `strings`.

The password you will find is the next level file name (so if you find `password is something`, then the next file to hack is `./crackme/something`).


# Authors

The game was made by Dominik Czarnota & Dariusz Zielinski for university classes at AGH University of Science and Technology in Cracow.


# Hints/tools needed for particular level

Level 0 - warmup - `strace` / `strings`

Level 1 - `strace` / `grep`

Level 2 - `strace`, knowledge of file descriptors (and which file descriptors are usually opened for an executable?)

Level 3 - `strace` (did you know that you can read about syscall using `man`? e.g. `man 2 read`)

Level 4 - one of `g++` / `clang++` sanitizer (refer to `man g++` or read up documentation) should tell you what's wrong; you have to fix the program in here (so yeah, `cp` the source, change something and recompile)

Level 5 - `strace`

Level 6 - the binary is compiled with `-pg` flag; use `gprof`

Level 7 - `gdb`

