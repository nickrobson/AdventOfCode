lines = []
formula = None

with open('input', 'r') as f:
    line = None
    while line != '':
        line = f.readline().strip()
        lines.append(line)
    lines.pop()
    formula = f.readline().strip()

repls = []
for line in lines:
    spl = line.split(' ')
    repls.append((spl[0], spl[2]))

molecules = set()

for a, b in repls:
    for i in range(len(formula)):
        if formula[i:i+len(a)] == a:
            molecules.add(formula[:i] + b + formula[i+len(a):])

print len(molecules)