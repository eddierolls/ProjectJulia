function main()
    letters = collect('A':'Z')
    scoreDict = Dict(letters[l]=>l for l=1:26)
    score = 0
    open("inputs/022.txt") do file
        names = readline(file)
        names = split(names[2:end-1],"\",\"")
        sort!(names)
        for i = 1:size(names,1)
            score+=sum([scoreDict[l] for l=names[i]])*i
        end
    end
    return score
end

print(main())