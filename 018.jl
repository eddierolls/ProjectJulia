function maxPathSum(in)
    newScores = in[1][1]
    for i = 2:size(in,1)
        oldScores = newScores
        newScores = Vector{Int32}(undef,i)
        newScores[1] = oldScores[1] + in[i][1]
        for j = 2:i-1
            newScores[j] = in[i][j] + max(oldScores[j-1],oldScores[j])
        end
        newScores[i] = oldScores[i-1] + in[i][i]
    end
    return maximum(newScores)
end

function main()
    arr = Any[]
    open("inputs/018.txt") do file
        for line in eachline(file)
            push!(arr,map(x-> parse(Int32,x),split(line)))
        end
    end
    println(maxPathSum(arr))
end

main()