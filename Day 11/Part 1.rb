def check_rule_one(str)
    for i in 0...str.length
        if i > 1 && str[i-2].next == str[i-1] && str[i-1].next == str[i]
            return true
        end
    end
    return false
end

def check_rule_two(str)
    for i in 0...str.length
        if str[i] == 'i' || str[i] == 'o' || str[i] == 'l'
            return false
        end
    end
    return true
end

def check_rule_three(str)
    return str.scan(/(.)\1/).length >= 2
end

def check_rules(str)
    return check_rule_one(str) && check_rule_two(str) && check_rule_three(str)
end

def increment(str, index)
    char = str[index]
    if char == 'z'
        str[index] = 'a'
        if index > 0
            increment(str, index-1)
        end
    else
        str[index] = char.next
    end
end

input = "vzbxkghb"

loop do 
  increment(input, input.length-1)
  break if check_rules(input)
end 

puts input
