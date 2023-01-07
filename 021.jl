include("utils/primes.jl")

function getDivisorSum(x)
    divisors = getAllDivisors(x)
    return sum(divisors)-x
end

function main()
    amicableSum = 0
    for i=2:10000
        j = getDivisorSum(i)
        if i!=j && i==getDivisorSum(j)
            amicableSum+=i
        end
    end
    return amicableSum
end

println(main())