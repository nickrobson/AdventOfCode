#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Day 1: Help Santa find the right floor.
# Part 2: Figure out when he enters the basement.
# - Nick Robson

with open('input') as f:
    instructions = f.readline()

    floor = 0
    basement = False

    for i in range(0, len(instructions)):
        if instructions[i] == '(':
            floor += 1
        elif instructions[i] == ')':
            floor -= 1
        if floor < 0 and not basement:
            basement = True
            print 'Santa entered the basement at position ' + str(i+1) 