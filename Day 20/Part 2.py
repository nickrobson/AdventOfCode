import sys

num = 0

with open('input', 'r') as f:
    num = int(f.readline().strip())

def presents(n):
    factors = reduce(lambda x,y: x|y, (set([i, n//i]) for i in xrange(1, int(1+n**(1.0/2))) if n % i == 0), set())
    return reduce(lambda x,y: x+y, [i*11 for i in factors if n / i <= 50], 0)

i =  0
while True:
    n = presents(i)
    if i % 10000 == 0:
        print i, n
    if n >= num:
        print 'FOUND NUMBER: %d !!!' % i
        sys.exit(0)
    i += 1