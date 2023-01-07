function main()
    digits = collect(0:9)
    out = Int64(0)
    pos = 1000000
    for i=1:9
        nPerm = factorial(10-i)
        ixDig = (pos-1) ÷ nPerm
        pos -= ixDig * nPerm
        out += 10^(10-i) * digits[ixDig+1]
        deleteat!(digits,ixDig+1)
    end
    out += digits[1]
    return out
end

println(main())