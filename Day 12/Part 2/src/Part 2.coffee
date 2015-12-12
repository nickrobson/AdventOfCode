fs = require 'fs'
traverse = require 'traverse'

input = fs.readFileSync '../input', 'utf-8'

total = 0

sum = (obj) ->
    the_sum = 0
    if typeof (obj) == 'number'
        return obj
    if typeof (obj) == 'string'
        return 0
    if Array.isArray(obj)
        for v in obj
            the_sum += sum v
        return the_sum
    for k,v of obj
        if v == 'red'
            return 0
        the_sum += sum v
    return the_sum

console.log sum JSON.parse input

