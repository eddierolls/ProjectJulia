include("utils/primes.jl")

function concat(a,b)
    return parse(Int64,string(a)*string(b))
end

# There's presumably a cleverer way to do this involving pruning, but this proved sufficiently fast
function recursePrimePairs(p,primePairs,thisSet,thisDepth)
    if thisDepth==0
        return p
    end
    thisSet = intersect(thisSet,primePairs[p])
    score = typemax(Int32)
    if length(thisSet)==0
        return nothing
    else
        for pNext = thisSet
            thisScore = recursePrimePairs(pNext,primePairs,thisSet,thisDepth-1)
            if thisScore!=nothing && thisScore<score
                score = thisScore
            end
        end
        if score<typemax(Int32)
            return score + p
        else
            return nothing
        end
    end
end

function main(sumTo=5)
    primes = primesLessThan(10^8)
    primeSet = Set(primes)
    primes = primesLessThan(10^4)
    primePairs = Dict(p=>[] for p=primes)
    for ix1 = 2:length(primes)
        for ix2 = 1:ix1-1
            if in(concat(primes[ix1],primes[ix2]),primeSet) && in(concat(primes[ix2],primes[ix1]),primeSet)
                push!(primePairs[primes[ix2]],primes[ix1])
            end
        end
    end
    bestSum = typemax(Int32)
    for p = keys(primePairs)
        thisSum = recursePrimePairs(p,primePairs,primes,sumTo-1)
        if thisSum!=nothing && thisSum<bestSum
            bestSum = thisSum
        end
    end
    return bestSum
end

println(main(5))