function main()
    # Note this relies on a,b always being coprime (proven; not provided)
    a,b = BigInt(3),BigInt(2) # a is numerator, b is denominator
    longSum = 0
    for iter = 2:1000
        a,b = 2*b+a,b+a
        if length(string(a))>length(string(b))
            longSum+=1
        end
    end
    return longSum
end

println(main())