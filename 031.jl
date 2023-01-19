function main(maxCount)
    coins = [1,2,5,10,20,50,100,200]
    nCounts = zeros(Int32,maxCount,length(coins))
    for tot=1:maxCount
        for iC=1:length(coins)
            if iC==1
                nCounts[tot,1] = 1
            elseif coins[iC]<tot
                nCounts[tot,iC] = nCounts[tot-coins[iC],iC] + nCounts[tot,iC-1]
            elseif coins[iC]==tot
                nCounts[tot,iC] = 1 + nCounts[tot,iC-1]
            else
                nCounts[tot,iC] = nCounts[tot,iC-1]
            end
        end
        println((tot,nCounts[tot,length(coins)]))
    end
    return nCounts[maxCount,length(coins)]
end

println(main(200))