function main()
    out = Dict(i=>0 for i=1:1000)
    for i=1:333
        for j=i:500
            perim = i+j+(i^2+j^2)^0.5
            if round((i^2+j^2)^0.5)==(i^2+j^2)^0.5 && perim<=1000
                out[perim]+=1
            end
        end
    end
    return sort([(v,k) for (k,v) in out],rev=true)[1][2]
end

println(main())