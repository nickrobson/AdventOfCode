module adventofcode

import java.util.regex.Pattern

function main = |args| {
    var input = fileToText("input", "UTF-8")
    var pattern = compile("^(\\w+).*?(lose|gain).*?([0-9]+).*?(\\w+)\\.$")
    var m = map[]
    foreach line in input: split("\\n") {
        var matcher = pattern: matcher(line)
        matcher: find()
        var a = matcher: group(1)
        var b = matcher: group(4)
        var n = matcher: group(3): toInt()
        if matcher: group(2) == "lose" {
            n = 0 - n
        }
        var m2 = m: getOrDefault(a, map[])
        m2: put(b, n)
        m: put(a, m2)
    }
    m: put("me", map[])
    foreach k in m: keySet() {
        var m2 = m: get(k)
        m2: put("me", 0)
        m: put(k, m2)
        var m3 = m: get("me")
        m3: put(k, 0)
        m: put("me", m3)
    }
    println(get_best(m, list[]))
}

function add = |ls, el| {
    var cp = list[el foreach el in ls]
    if not cp: contains(el) {
        cp: add(el)
    }
    return cp
}

function get_best = |m, chain| {
    var max = 0
    if chain: size() >= m: size() {
        max = max + m: get(chain: get(0)): get(chain: get(chain: size() - 1))
        max = max + m: get(chain: get(chain: size() - 1)): get(chain: get(0))
        for (var i = 0, i < chain: size() - 1, i = i + 1) {
            max = max + m: get(chain: get(i)): get(chain: get(i+1))
            max = max + m: get(chain: get(i+1)): get(chain: get(i))
        }
    } else if chain: size() == 0 {
        foreach k in m: keySet() {
            var n = get_best(m, add(chain, k))
            if n > max {
                max = n
            }
        }
    } else {
        var last = chain: get(chain: size() - 1)
        foreach entry in m: get(last): entrySet() when not chain: contains(entry: getKey()) {
            var n = get_best(m, add(chain, entry: getKey()))
            if n > max {
                max = n
            }
        }
    }
    return max
}