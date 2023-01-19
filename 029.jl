include("utils/primes.jl")

function main(maxA=100,maxB=100)
    allDecom = Set()
    for a=2:maxA
        primes = primeDivisors(a)
        for b=2:maxB
            decom = [(k,v*b) for (k,v) in primes]
            push!(allDecom,decom)
        end
    end
    return length(allDecom)
end

println(main(100,100))