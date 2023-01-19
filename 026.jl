function getCycle(denom)
    num = 1
    numSeen = Dict()
    ind = 0
    while !haskey(numSeen,num)
        numSeen[num] = ind
        num = (10*num)%denom
        ind+=1
    end
    return ind - numSeen[num]
end

function main()
    maxCycle = 0
    index = 0
    for i=1:1000
        thisCycle = getCycle(i)
        if thisCycle>maxCycle
            maxCycle = thisCycle
            index = i
        end
    end
    println((index,getCycle(index)))
end

main()

