include("utils/primes.jl")

if sum(primesLessThan(10))!=17
    error("Test fail")
else
    println(sum(primesLessThan(2*10^6)))
end