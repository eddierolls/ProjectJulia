function calcNext(x,a,b,c)
    c2 = (x-b^2)/c
    a2 = floor((x^0.5+(b))/c2)
    b2 = a2*c2-b
    return a2,b2,c2
end

function getContinuedFraction(num)
    a,b,c = floor(num^0.5),floor(num^0.5),1
    out = [a]
    state = []
    while !in((a,b,c),state)
        push!(state,(a,b,c))
        a,b,c = calcNext(num,a,b,c)
        push!(out,a)
    end
    return [Int16(x) for x=out[1:end-1]]
end