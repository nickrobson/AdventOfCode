local f = io.open('input', 'r')

local reindeer_dists = {}

local points = {}

local function add_point(reindeer)
    if points[reindeer] == nil then
        points[reindeer] = 0
    end
    points[reindeer] = points[reindeer] + 1
end

local num_seconds = 2503

for i=1,num_seconds do
    reindeer_dists[i] = {}
end

local function get_distance(second, speed, speed_seconds, wait_seconds)

    local total_seconds = speed_seconds + wait_seconds

    local num_total = math.floor(second / total_seconds)
    local num_partial = second % total_seconds

    local dist_partial = 0

    if num_partial >= speed_seconds then
        dist_partial = speed * speed_seconds
    else
        dist_partial = speed * num_partial
    end

    return num_total * speed * speed_seconds + dist_partial
end

local line = f:read('*line')
while line ~= nil do

    local _, _, reindeer, speed, speed_seconds, wait_seconds = line:find('(%w+) can fly (%d+) km/s for (%d+) [%w, ]+ (%d+)')
    speed         = tonumber(speed)
    speed_seconds = tonumber(speed_seconds)
    wait_seconds  = tonumber(wait_seconds)

    for i=1,num_seconds do
        reindeer_dists[i][reindeer] = get_distance(i, speed, speed_seconds, wait_seconds)
    end

    line = f:read('*line')
end

for i=1,num_seconds do
    local max_dist = 0
    local max_reindeer = {}
    for r,v in pairs(reindeer_dists[i]) do
        if v > max_dist then
            max_dist = v
            max_reindeer = {}
        end
        if v >= max_dist then
            max_reindeer[#max_reindeer] = r
        end
    end
    for k,v in pairs(max_reindeer) do
        add_point(v)
    end
end

local max_deer = {}
local max_d = 0

for k,v in pairs(points) do
    if v > max_d then
        max_d = v
        max_deer = k
    end
    print(k .. ' has ' .. tostring(v) .. ' points')
end

print(max_deer .. ' ' .. tostring(max_d))

