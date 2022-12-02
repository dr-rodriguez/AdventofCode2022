# Day 1

verbose = false

# Sample input
input = """1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"""

# Read from file
f = open("data/day1.txt", "r")
input = read(f, String)
close(f)

input = split(input, '\n')

# Gather information
elf_sums = Array{Int, 1}()
append!(elf_sums, [0])
elf_num = 1
for i in eachindex(input)
    # Get the relevant text
    text = strip(input[i], '\n')
    text = strip(input[i], '\r')  # Windows new line

    # Check if blank line, if so increment the elf number and skip
    if isempty(text)
        if verbose 
            println("New elf!")
        end
        global elf_num += 1
        continue
    end

    # Store the number of calories for each elf
    if verbose 
        println("Elf: ", elf_num, " cals: ", text)
    end
    calories = parse(Int, text)
    if length(elf_sums) < elf_num
        append!(elf_sums, [0])
    end

    global elf_sums[elf_num] += calories
    if verbose 
        println(elf_sums[elf_num])
    end
end

if verbose
    println(elf_sums)
end

# Print answer
println("Maximum and index: ", findmax(elf_sums))

# Star Two
