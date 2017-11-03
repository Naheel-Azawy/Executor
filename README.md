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
- Vala	(valac)
- Genie	(valac)
- TypeScript	(tsc and node)
- Intel Assembly (nasm)

### Installation
```sh
$ ./install
```
### Usage
```sh
$ exec hello.c
```
Or even better, add a shebang to your file
test.vala:
```c
#!/bin/exec
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

### Clean up
Binaries will be generated under '.execs' directory. You can remove it manually if you wish.

### License
GPL

