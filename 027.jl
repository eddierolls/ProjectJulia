include("utils/primes.jl")

function main()
    allPrimes = Set(primesLessThan(10^5))
    aRange = -69:2:1000 # a must be odd and can't be that negative as the output must be negative
    bRange = [b for b=allPrimes if b>40 && b<1000] # b must be positive, prime, and we know 41 is a lower bound
    bestProduct = 0
    bestRun = 0
    for a = aRange
        for b = bRange
            n=1
            while in((n^2 + a*n + b),allPrimes)
                n+=1
            end
            if n>bestRun
                bestRun = n
                bestProduct = a*b
                # println((n,a,b))
            end
        end
    end
    return bestProduct
end

println(main())