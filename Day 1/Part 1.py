#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Day 1: Help Santa find the right floor.
# Part 1: Figure out which floor he ends up at.
# - Nick Robson

with open('input') as f:
    instructions = f.readline()

    floor = 0

    for i in range(0, len(instructions)):
        if instructions[i] == '(':
            floor += 1
        elif instructions[i] == ')':
            floor -= 1

    print 'Santa ended up at floor ' + str(floor)