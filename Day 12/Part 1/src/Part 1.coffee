fs = require 'fs'
traverse = require 'traverse'
input = JSON.parse fs.readFileSync '../input', 'utf-8'
sum = 0
traverse(input).forEach(
    (x) ->
        if typeof (x) == 'number'
            sum += x 
)
console.log sum