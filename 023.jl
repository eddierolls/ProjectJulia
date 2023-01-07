include("utils/primes.jl")
import Combinatorics.with_replacement_combinations

function main()
    # Get all abundant numbers
    abundant = Int32[]
    for x=1:28123
        primes = getAllDivisors(x,false)
        if sum(primes)>x
            push!(abundant,x)
        end
    end
    # Sum all pairs of abundant numbers
    allSum = Set{Int32}()
    for (i,j) = with_replacement_combinations(abundant,2)
        push!(allSum,i+j)
    end
    return sum([x for x=1:28123 if !in(x,allSum)])
end

println(main())