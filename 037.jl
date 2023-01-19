include("utils/primes.jl")

function main()
    out = []
    i = 2
    while length(out)<11
        primes = Set(primesLessThan(10^i))
        primesThis = [p for p in primes if p>10^(i-1)]
        for p in primesThis
            pStr = string(p)
            isTrunct = true
            for i=length(pStr)-1:-1:1
                if !in(parse(Int64,pStr[1:i]),primes) || !in(parse(Int64,pStr[end-i+1:end]),primes)
                    isTrunct=false
                    break
                end
            end
            if isTrunct
                push!(out,p)
            end
        end
        i+=1
        println((i,length(out)))
    end
    return sum(out)
end

println(main())