function getTri(n)
    return Int64(n*(n+1)/2)
end

function getPent(n)
    return Int64(n*(3*n-1)/2)
end

function getHex(n)
    return Int64(n*(2*n-1))
end

function main()
    i=286
    j=165
    k=143
    allNum = [getTri(i),getPent(j),getHex(k)]
    while allNum[1]!=allNum[2] || allNum[2]!=allNum[3]
        if allNum[1]<allNum[2] || allNum[1]<allNum[3]
            i+=1
            allNum[1] = getTri(i)
        elseif allNum[1]>allNum[2]
            j+=1
            allNum[2] = getPent(j)
        elseif allNum[1]>allNum[3]
            k+=1
            allNum[3] = getHex(k)
        end
    end
    println((i,j,k))
    return allNum[1]
end

println(main())