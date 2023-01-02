for a = 1:500
    for b = 1:a
        if a^2 + b^2 == (1000-a-b)^2
            println((a,b,a*b*(1000-a-b)))
        end
    end
end