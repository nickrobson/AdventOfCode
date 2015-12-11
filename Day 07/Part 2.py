import re

input_lines = []
sources = dict()
all_sources = set()

def get_val(a):
    try:
        return int(a)
    except:
        dasrc = sources.get(a)
        return dasrc.val() if dasrc is not None else 0

class Source:
    def val(self):
        return 0
    def reset(self):
        self.cache = None

class Number(Source):
    def __init__(self, n):
        self.n = n
    def val(self):
        return self.n

class Wire(Source):
    def __init__(self, src):
        self.src = src
    def val(self):
        if self.src is None:
            return 0
        return get_val(self.src)

class AND_Gate(Source):
    def __init__(self, a, b):
        self.a = a
        self.b = b
        self.cache = None
    def val(self):
        print self.a, 'AND', self.b
        if self.a is None or self.b is None:
            return 0
        if self.cache is not None:
            return self.cache
        self.cache = get_val(self.a) & get_val(self.b)
        return self.cache

class OR_Gate(Source):
    def __init__(self, a, b):
        self.a = a
        self.b = b
        self.cache = None
    def val(self):
        print self.a, 'OR', self.b
        if self.a is None or self.b is None:
            return 0
        if self.cache is not None:
            return self.cache
        self.cache = get_val(self.a) | get_val(self.b)
        return self.cache

class NOT_Gate(Source):
    def __init__(self, a):
        self.a = a
        self.cache = None
    def val(self):
        print 'NOT', self.a
        if self.a is None:
            return 0
        if self.cache is not None:
            return self.cache
        self.cache = 65535 - get_val(self.a)
        return self.cache

class LSHIFT_Gate(Source):
    def __init__(self, a, n):
        self.a = a
        self.n = n
        self.cache = None
    def val(self):
        print self.a, 'LSHIFT', self.n
        if self.a is None:
            return 0
        if self.cache is not None:
            return self.cache
        self.cache = get_val(self.a) << self.n
        return self.cache

class RSHIFT_Gate(Source):
    def __init__(self, a, n):
        self.a = a
        self.n = n
        self.cache = None
    def val(self):
        print self.a, 'RSHIFT', self.n
        if self.a is None:
            return 0
        if self.cache is not None:
            return self.cache
        self.cache = get_val(self.a) >> self.n
        return self.cache

with open('input', 'r') as f:
    input_lines = f.read().splitlines()

for line in input_lines:
    obj = re.match('([a-z]+|[0-9]+)? ?(AND|OR|NOT|LSHIFT|RSHIFT)? ?([a-z]+|[0-9]+)? -> ([a-z]+)', line)
    a  = obj.group(1)
    op = obj.group(2)
    b  = obj.group(3)
    to = obj.group(4)
    src = None
    if op is None:
        try:
            src = Number(int(a))
        except:
            src = Wire(a)
    elif op == 'NOT':
        src = NOT_Gate(b)
    elif op == 'AND':
        src = AND_Gate(a, b)
    elif op == 'OR':
        src = OR_Gate(a, b)
    elif op == 'LSHIFT':
        src = LSHIFT_Gate(a, int(b))
    elif op == 'RSHIFT':
        src = RSHIFT_Gate(a, int(b))

    if src is not None:
        sources[to] = src
        all_sources.add(src)

sources['b'] = Number(sources['a'].val()) # sets 'b' to whatever 'a' is

for sss in all_sources:                   # uncaches the values at all wires
    sss.reset()                           #   so the recalculation of 'a' works

print sources['a'].val() if 'a' in sources.keys() else 0      # calculate of 'a' !
