function collatzLength!(inDict,num)
    if num==1
        inDict[1] = 1
        return 1
    elseif haskey(inDict,num)
        # Do nothing
    elseif num%2==0
        inDict[num] = collatzLength!(inDict,num÷2) + 1
    else
        inDict[num] = collatzLength!(inDict,3*num+1) + 1
    end
    return inDict[num]
end

maxCollatz = 0
collatzAt = 0
initDict = Dict()
for i=1:10^6-1
    if collatzLength!(initDict,i)>maxCollatz
        global maxCollatz = initDict[i]
        global collatzAt = i
    end
end
println((collatzAt,maxCollatz))