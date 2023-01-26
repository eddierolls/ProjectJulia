include("utils/primes.jl")

function main()
    out = 0
    for i = 1:10^7
        if length(primeDivisors(i))==4 && length(primeDivisors(i+1))==4 && length(primeDivisors(i+2))==4 && length(primeDivisors(i+3))==4
            out = i
            break
        end
    end
    return out
end

println(main())