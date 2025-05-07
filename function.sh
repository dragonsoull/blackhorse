#!/usr/bin/env bash
#

f1(){
	echo "Greetings $1, good morning!"
	echo "Greetings $2, good evenning!"
    echo "This is a function called $FUNCNAME"
}
f1 John Doe

f2(){
i=1
for f in "$@";
do
	echo "The $i argument is $f"
	((i++))
done

}
f2 /home/$USER/*

x=8
y=7
f3(){
	x=0
	local y=1
	((y++))
}
echo "the value of x before calling f3 is $x"
echo "the value of y before calling f3 is $y"
f3
echo "the value of x after calling f3 is $x"
echo "the value of y after calling f3 is $y"