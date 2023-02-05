function calcNext(x,a,b,c)
    c2 = (x-b^2)/c
    a2 = floor((x^0.5+(b))/c2)
    b2 = a2*c2-b
    return a2,b2,c2
end

function main()
    allSq = Set([i^2 for i=1:100])
    thisRange = [i for i=1:10000 if !in(i,allSq)]
    out = 0
    for x=thisRange
        a,b,c = floor(x^0.5),floor(x^0.5),1
        state = []
        while !in((a,b,c),state)
            push!(state,(a,b,c))
            a,b,c = calcNext(x,a,b,c)
        end
        period = length(state) - findall(x->x==(a,b,c),state)[1] + 1
        out += (period % 2)
    end
    return out
end

println(main())