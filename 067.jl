include("018.jl")

arr = Any[]
open("inputs/067.txt") do file
    for line in eachline(file)
        push!(arr,map(x-> parse(Int32,x),split(line)))
    end
end
println(maxPathSum(arr))