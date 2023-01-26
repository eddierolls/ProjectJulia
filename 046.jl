include("utils/primes.jl")

function main()
    out = 0
    for i=2:9
        primes = primesLessThan(10^i)
        primesSet = Set(primes)
        for j=(10^(i-1)+1):2:(10^i)
            if !in(j,primesSet)
                contained = false
                ix = 1
                while primes[ix]<j
                    root = ((j-primes[ix])/2)^0.5
                    if floor(root)==root
                        contained=true
                        break
                    end
                    ix+=1
                end
                if !contained
                    out = j
                    break
                end
            end
        end
        if out>0
            break
        end
    end
    return out
end

println(main())