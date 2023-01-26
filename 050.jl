include("utils/primes.jl")

function main()
    primes = primesLessThan(10^6)
    primeSet = Set(primes)
    out = 0
    longestSeq = 21
    ixStart = 1
    finished = false
    while !finished
        thisPr = sum(primes[ixStart:ixStart+longestSeq-1])
        if thisPr>10^6
            finished = true
        end
        thisSeq = longestSeq
        while thisPr + primes[ixStart+thisSeq]<10^6
            thisPr+=primes[ixStart+thisSeq]
            if in(thisPr,primeSet)
                longestSeq = thisSeq
                out = thisPr
            end
            thisSeq+=1
        end
        ixStart+=1
    end
    return out
end

println(main())