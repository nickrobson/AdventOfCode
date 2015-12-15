local f = io.open('input', 'r')

local max_dist = 0
local max_reindeer = ''

local line = f:read('*line')
while line ~= nil do

    local _, _, reindeer, speed, speed_seconds, wait_seconds = string.find(line, '(%w+) can fly (%d+) km/s for (%d+) [%w, ]+ (%d+)')
    speed = tonumber(speed)
    speed_seconds = tonumber(speed_seconds)
    wait_seconds = tonumber(wait_seconds)

    local total_seconds = speed_seconds + wait_seconds

    local num_total = math.floor(2503 / total_seconds)
    local num_partial = 2503 % total_seconds

    local dist_partial = 0
    if num_partial >= speed_seconds then
        dist_partial = speed * speed_seconds
    else
        dist_partial = speed * num_partial
    end

    local dist = num_total * speed * speed_seconds + dist_partial

    if dist > max_dist then
        max_dist = dist
        max_reindeer = reindeer
    end

    line = f:read('*line')
end

print(max_reindeer .. ' ' .. tostring(max_dist))