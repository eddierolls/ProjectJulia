function main()
    out = 0
    for i=2:6*9^5
        if i==sum([parse(Int32,s)^5 for s in string(i)])
            out+=i
        end
    end
    return out
end

println(main())