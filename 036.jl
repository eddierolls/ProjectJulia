include("utils/bases.jl")

function main()
    out = 0
    for i=1:10^6
        if parse(Int32,reverse(string(i)))==i
            bin = num2bin(i)
            if bin==reverse(bin)
                out+=i
            end
        end
    end
    return out
end

println(main())