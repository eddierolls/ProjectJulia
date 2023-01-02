function multLessThan(x)
    arr = Int16[]
    sizehint!(arr,x)
    for i=1:x-1
        if (i%5==0) || (i%3==0)
            push!(arr,i)
        end
    end
    return arr
end

if sum(multLessThan(10))!=23
    error("Test Failed")
end
println(sum(multLessThan(1000)))