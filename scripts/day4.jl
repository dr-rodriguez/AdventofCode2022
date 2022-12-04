# Day 4

# Sample input
input = """2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"""

# Read from file
f = open("data/day4.txt", "r")
input = read(f, String)
close(f)

# Input preparation
input = replace(input, "\r\n" => "\n")  # Windows new line
input = split(input, "\n")

function fully_in(a, b, c, d)
    # Check if a-b is fully within c-d
    sub1 = collect(a:b)
    sub2 = collect(c:d)
    check = [s in sub2 for s in sub1]
    return all(check)
end

count = 0
for line in input
    el = split(line, (',','-'))
    el = parse.(Int32, el)
    
    if fully_in(el...) | fully_in(el[3], el[4], el[1], el[2])
        # println(el)
        global count+=1 
    end
end
println("Assignment pairs: ", count)

# Star 2

function any_overlap(a, b, c, d)
    # Check for any any overlap
    sub1 = collect(a:b)
    sub2 = collect(c:d)
    check = [s in sub2 for s in sub1]
    return any(check)
end

count = 0
for line in input
    el = split(line, (',','-'))
    el = parse.(Int32, el)
    
    if any_overlap(el...) | any_overlap(el[3], el[4], el[1], el[2])
        global count+=1 
    end
end
println("Any overlap: ", count)