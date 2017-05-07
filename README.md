# Executor
A little script that lets you run your code on the go!

### Supported files
- C	(gcc)
- C++	(g++)
- C#	(mono)
- Go	(gccgo)
- Rust	(rustc)
- Java	(javac)
- Vala	(valac)
- Genie	(valac)

### Installation
```sh
$ ./install
```
### Usage
```sh
$ exec hello.c
```
Or even better
-add a shebang to your file
test.vala:
```c
#!/bin/exec
void main() { print ("Hello!\n"); }
```
```sh
$ chmod +x test.vala
$ ./test.vala
```

### License
GPL

