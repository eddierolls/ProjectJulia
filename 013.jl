out = BigInt(0)
open("inputs/013.txt") do file
    for line in eachline(file)
        global out += parse(BigInt,line)
    end
end
print(out)