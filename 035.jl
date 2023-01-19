include("utils/primes.jl")
function main()
    primes = Set(primesLessThan(10^6))
    out = []
    for p = primes
        pStr = string(p)
        N = length(pStr)
        isCirc = true
        for i=1:length(pStr)-1
            pNew = pStr[i+1:N]*pStr[1:i]
            if !in(parse(Int32,pNew),primes)
                isCirc=false
                break
            end
        end
        if isCirc
            push!(out,p)
        end
    end
    return length(out)
end

println(main())