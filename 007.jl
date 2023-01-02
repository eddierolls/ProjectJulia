include("utils/primes.jl")

function primeN(n)
    # Calculate the nth prime
    for i=2:10
        allPrimes=primesLessThan(10^i)
        if size(allPrimes)[1]>=n
            return allPrimes[n]
        end
    end
    return nothing
end

if primeN(6)!=13
    error("Tests failed")
end
println(primeN(10001))