#!/bin/exec -m "$pHelloVala2.vala" TheArg
void main (string[] args) {
	print ("Hello Vala world\n");
	foo (args[1]);
}
