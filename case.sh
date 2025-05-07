#!/usr/bin/env bash
#
pet="dog"

case $pet in 
	bird) echo "the pet is a bird";;
	dog|puppy) echo "The pet is a dog";;
	*) echo "The pet is neither a bird nor a dog!";;
esac

