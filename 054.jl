struct Card
    value::Int8
    suit::Char
end

function getValue(v)
    if v=='A'
        return 14
    elseif v=='K'
        return 13
    elseif v=='Q'
        return 12
    elseif v=='J'
        return 11
    elseif v=='T'
        return 10
    else
        return parse(Int8,v)
    end
end

function scoreHand(hand)
    isFlush = length(unique([h.suit for h=hand]))==1
    isStraight = diff([h.value for h=hand],dims=1)==[1,1,1,1]
    handDict = Dict(i=>0 for i=2:14)
    for c=hand
        handDict[c.value]+=1
    end
    if isFlush && isStraight && hand[end].value==14
        score = 9
        tiebreak = 0
    elseif isFlush && isStraight
        score = 8
        tiebreak = hand[end].value
    elseif maximum(values(handDict))==4
        score = 7
        tiebreak = hand[3].value
    elseif maximum(values(handDict))==3 && length([v for v=values(handDict) if v==2])==1
        score = 6
        tiebreak = hand[3].value
    elseif isFlush
        score = 5
        tiebreak = sum([hand[i].value*15^i for i=1:5])
    elseif isStraight
        score = 4
        tiebreak = hand[end].value
    elseif maximum(values(handDict))==3
        score = 3
        tiebreak = maximum([k for k=keys(handDict) if handDict[k]==3])
    elseif length([v for v=values(handDict) if v==2])==2
        score = 2
        tiebreak1 = maximum([k for k=keys(handDict) if handDict[k]==2])
        tiebreak2 = minimum([k for k=keys(handDict) if handDict[k]==2])
        handVals = [h.value for h=hand if h.value!=tiebreak1 && h.value!=tiebreak2]
        tiebreak = tiebreak1*15^3 + tiebreak2*15^2 + handVals[1]*15
    elseif maximum(values(handDict))==2
        score = 1
        tiebreak = maximum([k for k=keys(handDict) if handDict[k]==2])
        handVals = [h.value for h=hand if h.value!=tiebreak]
        tiebreak = tiebreak*15^4 + sum([handVals[i]*15^i for i=1:3])
    else
        score = 0
        tiebreak = sum([hand[i].value*15^i for i=1:5])
    end
#     println((hand,score,tiebreak))
    return (score,tiebreak)
end

function main()
    wins = 0
    scoreDict = Dict(i=>0 for i=0:9)
    open("inputs/054.txt") do file
        for line in eachline(file)
            line = split(strip(line)," ")
            hands = [[],[]]
            for i=1:10
                card = Card(getValue(line[i][1]),line[i][2])
                if i<=5
                    push!(hands[1],card)
                else
                    push!(hands[2],card)
                end
            end
            for thisHand = hands
                sort!(thisHand,by = x -> x.value)
            end
            (score1,tiebreak1) = scoreHand(hands[1])
            (score2,tiebreak2) = scoreHand(hands[2])
            scoreDict[score1]+=1
            scoreDict[score2]+=1
            if score1>score2 || (score1==score2 && tiebreak1>tiebreak2)
                wins+=1
            end
        end
    end
    println(scoreDict)
    return wins
end

println(main())