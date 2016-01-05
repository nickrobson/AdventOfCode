import sys

num = 0

with open('input', 'r') as f:
    num = int(f.readline().strip())

def presents(n):
    factors = reduce(lambda x,y: x|y, (set([i, n//i]) for i in xrange(1, int(1+n**(1.0/2))) if n % i == 0), set())
    return reduce(lambda x,y: x+y, [i*10 for i in factors], 0)

for i in xrange(700000):
    if i % 10000 == 0:
        print i
    if presents(i) >= num:
        print 'FOUND NUMBER: %d !!!' % i
        sys.exit(0)