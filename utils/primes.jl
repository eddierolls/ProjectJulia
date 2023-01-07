function primesLessThan(num)
    # Returns an array of all primes less than or equal to num
    allPrimes = Int64[]
    isPrime = [false;trues(num-1)]
    for i=2:num
        if isPrime[i]
            push!(allPrimes,i)
            for j=i^2:i:num
                isPrime[j]=false
            end
        end
    end
    return allPrimes
end

function primeDivisors(num)
    # Returns a dict of prime divisors (keys) and the number of times each divisor appears (values)
    out = Dict()
    primes = primesLessThan(floor(Int64,num^0.5))
    for p = primes
        if p^2>num
            break
        end
        if num%p==0
            out[p] = 0
        end
        while num%p==0
            out[p]+=1
            num÷=p
        end
    end
    if num>1
        out[num] = 1
    end
    return out
end

function getAllDivisors(num,includeSelf=true)
    primes = primeDivisors(num)
    nextDivisors = Int64[1]
    for k = keys(primes)
        lastDivisors = nextDivisors
        nextDivisors = Int64[]
        for ld = lastDivisors
            for i = 0:primes[k]
                push!(nextDivisors,ld*k^i)
            end
        end
    end
    if !includeSelf
        deleteat!(nextDivisors,findall(x->x==num,nextDivisors))
    end
    return nextDivisors
end

function divisorCount(num)
    # Total divisors for num (e.g. 28 -> 1,2,4,7,14,28 = 6). Quicker than getAllDivisors
    totalDivisors = 1
    divisorsDict = primeDivisors(num)
    for v=values(divisorsDict)
        totalDivisors*=(v+1)
    end
    return totalDivisors
end

