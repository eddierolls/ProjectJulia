function main()
    words,input = nothing,nothing
    open("inputs/042.txt") do file
        words = readline(file)
        words = split(words[2:end-1],"\",\"")
    end
    wordSet = Set(words)
    open("inputs/059.txt") do file
        input = readline(file)
        input = map(x->parse(Int8,x),split(input,','))
    end
    charRange = Int('a'):Int('z')
    mostWords = 0
    message = nothing
    out = nothing
    for a=charRange
        for b=charRange
            for c=charRange
                thisScore = 0
                thisPwd = [a,b,c]
                thisMessage = []
                for ixIn = eachindex(input)
                    thisChar = Char(thisPwd[((ixIn-1)%3)+1] ⊻ input[ixIn])
                    push!(thisMessage,thisChar)
                end
                messageScore = sum(Int(s) for s=thisMessage)
                thisMessage = join(thisMessage)
                thisMessage = split(thisMessage," ")
                for w = thisMessage
                    if in(w,wordSet)
                        thisScore+=1
                    end
                end
                if thisScore>mostWords
                    message = thisMessage
                    mostWords = thisScore
                    out = messageScore
                end
            end
        end
    end
    return out
end
println(main())

