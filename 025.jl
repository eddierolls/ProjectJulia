function main(maxTarget)
    thisNum = BigInt(1)
    lastNum = BigInt(1)
    index = 2
    while thisNum<maxTarget
        thisNum,lastNum = (thisNum + lastNum),thisNum
        index+=1
    end
    return index
end

if main(10^2)!=12
    error("Tests Failed")
else
    println(main(BigInt(10)^999))
end


