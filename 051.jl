include("utils/primes.jl")

function main(target=8,maxNum=10^7)
    primes = primesLessThan(maxNum)
    primesDict = Dict()
    out = maxNum
    for p = primes
        pStr = string(p)
        pDict = Dict()
        for c = collect(pStr)
            if !haskey(pDict,c)
                pDict[c] = 0
            end
            pDict[c]+=1
        end
        for k = keys(pDict)
            if pDict[k]>=3
                allAnon = [""]
                for c = pStr
                    nextAnon = []
                    for a = allAnon
                        push!(nextAnon,a*c)
                        if c==k
                            push!(nextAnon,a*"*")
                        end
                    end
                    allAnon = nextAnon
                end
                for a = allAnon
                    if count("*",a)==3
                        if !haskey(primesDict,a)
                            primesDict[a] = []
                        end
                        push!(primesDict[a],p)
                        if length(primesDict[a])==target
                            out = min(out,primesDict[a][1])
                        end
                    end
                end
            end
        end
    end
    return out
end

println(main(8,10^6))