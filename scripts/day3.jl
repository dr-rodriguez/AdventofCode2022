# Day 3

# Sample input
input = """vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"""

# Read from file
f = open("data/day3.txt", "r")
input = read(f, String)
close(f)

input = replace(input, "\r\n" => "\n")  # Windows new line
input = split(input, "\n")

function get_number(x)
    # Get the number for a particular letter

    # First ensures it is a char and not a string
    x = first(x)
    value = Int32(x)

    if islowercase(x)
        value -= 96
    else
        value -= 38
    end

    return value
end

total_priority = 0
for i in eachindex(input)
    # Split the string into two equal components
    l = length(input[i])
    h = Int32(l/2)
    sub1 = input[i][1:h]
    sub2 = input[i][h+1:l]

    # Find the common letters, case-sensitive in each one
    common =  ""
    for j in sub1
        if occursin(j, sub2) & !occursin(j, common)
            common = string(common, j)
        end
    end

    # Count up the priority
    priority = 0
    for letter in common
        priority += get_number(letter)
    end
    
    # println(sub1, " ", sub2)
    # println(common, " ", priority)
    global total_priority += priority
end
println("Total priority ", total_priority)
