function getPent(n)
    return Int64(n*(3*n-1)/2)
end

function main()
    bestDiff = 9999999
    allPent = [getPent(n) for n=1:10000]
    pentSet = Set(allPent)
    i=2
    while bestDiff>allPent[i]-allPent[i-1] && 2*allPent[i]<allPent[end]
        for j=1:i-1
            if in(allPent[i]+allPent[j],pentSet) && in(allPent[i]-allPent[j],pentSet) && allPent[i]-allPent[j]<bestDiff
                bestDiff = allPent[i]-allPent[j]
            end
        end
        i+=1
    end
    return bestDiff
end

println(main())