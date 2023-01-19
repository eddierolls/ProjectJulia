function main()
    allFrac = Vector()
    for dem=12:99 # I realised late on that this should be den, but meh
        for num=11:dem-1
            numS = string(num)
            demS = string(dem)
            if ~(occursin("0",demS) || occursin("0",numS))
                for s=collect("123456789")
                    if occursin(s,demS) && occursin(s,numS)
                        ix = findall(x->x==s,numS)[1]
                        numThis = numS[3-ix]
                        ix = findall(x->x==s,demS)[1]
                        demThis = demS[3-ix]
                        if num/dem == parse(Int64,numThis)/parse(Int64,demThis)
                            push!(allFrac,(num,dem))
                        end
                    end
                end
            end
        end
    end
    num = prod([f[1] for f=allFrac])
    dem = prod([f[2] for f=allFrac])
    for i=num:-1:1
        if num%i==0 && dem%i==0
            num÷=i
            dem÷=i
        end
    end
    println(dem)
end

main()