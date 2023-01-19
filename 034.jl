function main()
    out=0
    for num = 3:7*factorial(9)
        if sum([factorial(parse(Int32,s)) for s=collect(string(num))])==num
            out+=num
        end
    end
    return out
end

println(main())