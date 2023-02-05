function main()
    out = 0
    i = 1
    while Int128(9)^i>Int128(10)^(i-1)
        j = Int128(1)
        while j^i<Int128(10)^i
            if j^i>=Int128(10)^(i-1)
                out+=1
            end
            j+=1
        end
        println((i,out))
        i+=1
    end
    return out
end

println(main())