include("utils/powers.jl")

function main()
    k = 10^10
    out = sum([Int64(powerMod(i,i,k)) for i=1:1000]) % k
    return out
end

println(main())