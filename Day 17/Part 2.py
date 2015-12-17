containers = [33, 14, 18, 20, 45, 35, 16, 35, 1, 13, 18, 13, 50, 44, 48, 6, 24, 41, 30, 42]

def add_array(arr, el):
    arr2 = []
    for e in arr:
        arr2.append(e)
    arr2.append(el)
    return arr2

min_found = 10000000
num_found = 0

def find_suitable(current_sum, last_visited, path):
    global min_found, num_found
    if current_sum == 150:
        plen = len(path)
        if plen < min_found:
            min_found = plen
            num_found = 0
        if plen == min_found:
            num_found += 1
    ncont = len(containers)
    if current_sum >= 150 or last_visited+1 == ncont:
        return
    for i in range(last_visited+1, ncont):
        find_suitable(current_sum + containers[i], i, add_array(path, containers[i]))

find_suitable(0, -1, [])

print num_found