import sys

lines = []
grid  = []

with open('input', 'r') as f:
    lines = f.read().splitlines()

for y in range(len(lines)):
    line = lines[y]
    grid_line = []
    for x in range(len(line)):
        grid_line.append(1 if line[x] == '#' else 0)
    grid.append(grid_line)

def print_grid():
    print '\n== GRID ==\n'
    for y in range(len(grid)):
        for x in grid[y]:
            sys.stdout.write('#' if x == 1 else '.')
        sys.stdout.write('\n')

def neighbours(x, y):
    neighbours = 0
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            ox, oy = x+dx, y+dy
            if ox >= 0 and oy >= 0 and ox < len(grid[y]) and oy < len(grid):
                if grid[oy][ox] == 1:
                    if ox != x or oy != y:
                        neighbours += 1
    return neighbours

def step():
    global grid
    print_grid()
    newgrid = []
    for y in range(len(grid)):
        line = grid[y]
        newline = []
        for x in range(len(line)):
            val = 0
            on = grid[y][x] == 1
            n = neighbours(x, y)
            if on:
                val = 1 if n in (2, 3) else 0
            else:
                val = 1 if n == 3 else 0
            newline.append(val)
        newgrid.append(newline)
    grid = newgrid


for i in range(100):
    step()

print_grid()

tmp = []
for line in grid:
    tmp.extend(x for x in line if x == 1)
on = len(tmp)
print on