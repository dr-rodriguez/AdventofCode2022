# Day 5

# sample
input = """    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"""

stacks = [
    ["Z","N"], 
    ["M","C","D"],
    ["P"]]

# Read from file
f = open("data/day5.txt", "r")
input = read(f, String)
close(f)

stacks = [
    split("GDVZJSB",""),
    split("ZSMGVP",""),
    split("CLBSWTQF",""),
    split("HJGWMRVQ",""),
    split("CLSNFMD",""),
    split("RGCD",""),
    split("HGTRJDSQ",""),
    split("PFV",""),
    split("DRSTJ","")
    ]
original_stacks = deepcopy(stacks)

# Input preparation
input = replace(input, "\r\n" => "\n")  # Windows new line
input = split(input, "\n")

for line in input
    # Skip non-move lines
    if !startswith(line, "move")
        continue
    end

    # Identify move information
    # println(line)
    a = match(r"move (\d+) from (\d+) to (\d+)", line)
    moves, ind_start, ind_end = parse.(Int32, a)
    # println(moves, ind_start, ind_end)

    # Perform moves
    while moves > 0
        crate = pop!(stacks[ind_start])
        push!(stacks[ind_end], crate)
        moves -= 1
    end

end
print("Top of each stack: ")
for ln in stacks
    print(last(ln))
end
println("")

# Star 2
stacks = deepcopy(original_stacks)

for line in input
    # Skip non-move lines
    if !startswith(line, "move")
        continue
    end

    # Identify move information
    a = match(r"move (\d+) from (\d+) to (\d+)", line)
    moves, ind_start, ind_end = parse.(Int32, a)

    # Perform moves
    crate_set = ""
    while moves > 0
        crate = pop!(stacks[ind_start])
        crate_set = string(crate_set, crate)
        moves -= 1
    end
    append!(stacks[ind_end], split(reverse(crate_set), ""))
end

print("Top of each stack: ")
for ln in stacks
    print(last(ln))
end
