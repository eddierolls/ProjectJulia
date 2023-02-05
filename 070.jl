include("utils/primes.jl")
MAXNUM = 10^7

function main()
    primes = primesLessThan(MAXNUM)
    relPrTr = zeros(Int32,MAXNUM)
    for ixP = 1:lastindex(primes)
        p = primes[ixP]
        pCount = 0
        for i = p:p:MAXNUM
            relPrTr[i]+=pCount
            pCount+=1
        end
        for ixP2 = 1:ixP-1
            p2 = primes[ixP2]
            pCount = 0
            for i = p*p2:p*p2:MAXNUM
                relPrTr[i]-=pCount
                pCount+=1
            end
        end
    end
    quot = collect(0:MAXNUM-1)-relPrTr
    quot[1] = 1
end

println(main())