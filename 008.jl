allInt = Int8[]
sizehint!(allInt,1000)
open("inputs/008.txt") do file
    for line in eachline(file)
        append!(allInt,[parse(Int64,s) for s in chomp(line)])
    end
end

SEQLEN = 13
maxProd = 0
for i=1:1000-SEQLEN+1
    global maxProd = max(maxProd,prod(allInt[i:i+SEQLEN-1]))
end
println(maxProd)

