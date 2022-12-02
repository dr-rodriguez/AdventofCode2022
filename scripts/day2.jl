# Day 2

sep = "\r\n"

# Sample input
input = """A Y
B X
C Z"""

# Read from file
f = open("data/day2.txt", "r")
input = read(f, String)
close(f)

input = split(input, sep)

function hand_score(x)
    # Calculate score given the hand
    # Score by hand
    if x == "Y" || x == "B" # Paper
        score = 2
    elseif x == "X" || x == "A" # Rock
        score = 1
    else # Scissor
        score = 3
    end

    return score
end

function get_score(x, y)
    # Calculate score for the round

    score = hand_score(y)
    enemy = hand_score(x)

    # Score by victory
    if score == enemy
        # Draw
        score += 3
    elseif (score == 1 && enemy == 3) || (score == 2 && enemy == 1) || (score == 3 && enemy == 2)
        # Win
        score += 6
    else
        score += 0
    end

    return score
end

total_score = 0
for i in eachindex(input)
    a = split(input[i], ' ')
    round_score = get_score(a[1], a[2])
    global total_score += round_score
end
println("Total score: ", total_score)
