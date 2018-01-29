# Executor
Run everything like a script!

### Supported files
- C	(gcc)
- C++	(g++)
- C#	(mcs and mono)
- VisualBasic.NET   (vbnc and mono)
- Go	(gccgo)
- Rust	(rustc)
- Java	(javac)
- Kotlin    (kotlinc and java)
- Kotlin Script (kotlinc -script)
- Vala	(valac)
- Genie	(valac)
- TypeScript	(tsc and node)
- JavaScript    (node)
- Python    (python)
- GNU Octave    (octave)
- Intel Assembly (nasm)

### Installation
```sh
$ ./install
```
### Usage
```sh
$ execute hello.c
```
Or even better, add a shebang to your file
test.vala:
```c
#!/bin/execute
void main() { print ("Hello!\n"); }
```
```sh
$ chmod +x test.vala
$ ./test.vala
```
It's also possible to run a range of lines
```sh
$ ./test.ts --from 3 --to 5
```

### Gedit
Yes! it comes with a gedit plugin!

- Run `./install-gedit`
- Open gedit preferences -> plugins
- Enable Executor
- Enjoy 

![screenshot](./screenshot-gedit.png)

### Clean up
Binaries will be generated under '~/.execs' directory. You can remove it manually if you wish.

### License
GPL

