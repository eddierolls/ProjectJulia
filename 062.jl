function cubesBetween(num1,num2)
    return [BigInt(i)^3 for i=ceil(num1^(1/3)):floor(num2^(1/3))]
end

function main()
    out = typemax(Int128)
    for i=2:12
        cubes = cubesBetween(10^(i-1),10^i)
        cubesDict = Dict()
        for c = cubes
            cStr = join(sort(collect(string(c))))
            if !haskey(cubesDict,cStr)
                cubesDict[cStr] = [0,c]
            end
            cubesDict[cStr][1] += 1
        end
        for k = keys(cubesDict)
            if cubesDict[k][1]==5 && cubesDict[k][2]<out
                out = cubesDict[k][2]
            end
        end
        if out<typemax(Int128)
            break
        end
    end
    return out
end

println(main())