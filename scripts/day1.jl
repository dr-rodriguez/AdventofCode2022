
sample_input = """1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"""

sums = Array{Int}
for i in sample_input
    print(i)
end

findnext('\n', sample_input, 1)
findnext('\n', sample_input, 6)
findfirst('\n', sample_input)
findlast('\n', sample_input)

sample_input[1:5-1]

function sum(str, x, y)
    return convert(Int, str[x:y])
end

i = 1
while i <= findlast('\n', sample_input)
    j = findnext('\n', sample_input, i+1)
    if isnothing(j)
        print(sample_input[i:length(sample_input)])
        break
    else
        print(sample_input[i:j-1])
    end
    global i = j
end
