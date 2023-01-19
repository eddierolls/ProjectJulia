function main()
    panSet = Set()
    for i=1:99
        if i<10
            jRange = 1234:9876
        else
            jRange = 123:987
        end
        for j = jRange
            if join(sort(collect(string(i)*string(j)*string(i*j))))=="123456789"
                push!(panSet,i*j)
            end
        end
    end
    return sum(panSet)
end

println(main())