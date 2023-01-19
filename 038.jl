function main()
    out = 0
    for n=2:6
        i = 1
        tooBig = false
        while !tooBig
            pandig = join([string(i*x) for x=1:n])
            if length(pandig)>=10
                tooBig = true
            elseif length(pandig)==9 && join(sort(collect(pandig)))=="123456789"
                out = max(out,parse(Int64,pandig))
            end
            i+=1
        end
    end
    return out
end

println(main())