function primeFactors(num)
    x = 2
    out = Int32[]
    while x^2<=num
        if num%x == 0
            push!(out,x)
            while num%x==0
                num//=x
            end
        end
        x+=1
    end
    push!(out,num)
    return out
end

if primeFactors(13195)!=Int32[5,7,13,29] || maximum(primeFactors(13195))!=29
    error("Tests failed")
end
println(maximum(primeFactors(600851475143)))
