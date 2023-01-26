function main()
    allLetters = collect('A':'Z')
    scoreDict= Dict(allLetters[i] => i for i=1:26)
    allTri = Set([Int(n*(n+1)/2) for n=1:30])
    score = 0
    open("inputs/042.txt") do file
        words = readline(file)
        words = split(words[2:end-1],"\",\"")
        for w = words
            wordScore = sum([scoreDict[s] for s=w])
            if in(wordScore,allTri)
                score+=1
            end
        end
    end
    return score
end

println(main())