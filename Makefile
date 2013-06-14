#
# Makefile for bash and vim configure
#

all: update

update:
	git pull -q origin master

upload:
	git push -q origin master 


