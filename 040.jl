function main()
    out = []
    num = 1
    outLen = 0
    while outLen<1000000
        push!(out,string(num))
        num+=1
        outLen+=length(out[end])
    end
    out = join(out)
    return prod([parse(Int64,out[10^x]) for x=1:6])
end

println(main())