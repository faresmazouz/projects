SHELL := /bin/bash

.PHONY: up up-min down destroy status

up:
	vagrant up

up-min:
	vagrant up dmz monitor

down:
	vagrant halt

destroy:
	vagrant destroy -f

status:
	vagrant status
