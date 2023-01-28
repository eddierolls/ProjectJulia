include("utils/primes.jl")

function main()
    primes = primesLessThan(10^6)
    totalCount = 1
    primesCount = 0
    thisNum = 1
    while primesCount/totalCount>=0.1 || totalCount==1
        thisNum+=1
        newPrimes = [(2*thisNum-1)^2-(2*(thisNum-1))*i for i=1:3]
        totalCount+=4
        primesCount+=length([p for p=newPrimes if isPrimeFromList(p,primes)])
    end
    out = 2*thisNum-1
end
println(main())