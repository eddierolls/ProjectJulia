include("utils/primes.jl")

function main()
    primes = primesLessThan(10^4)
    prDict = Dict()
    for p = primes
        str = join(sort(collect(string(p))))
        if !haskey(prDict,str)
            prDict[str] = []
        end
        push!(prDict[str],p)
    end
    for k = keys(prDict)
        sort!(prDict[k])
        if length(prDict[k])>=3
            for a = 1:length(prDict[k])-2
                for b = a+1:length(prDict[k])-1
                    for c = b+1:length(prDict[k])
                        if (prDict[k][b]-prDict[k][a])==(prDict[k][c]-prDict[k][b]) && prDict[k][a]!=1487
                            return (prDict[k][a],prDict[k][b],prDict[k][c])
                        end
                    end
                end
            end
        end
    end
end

println(main())