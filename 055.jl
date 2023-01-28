function getPal(num)
    return parse(BigInt,join(reverse(string(num))))
end

function main()
    pSet = Set() # Numbers that end at palindromes
    lSet = Set() # Numbers that are Lychrel numbers
    for i=BigInt(9999):-1:1
        isLych = true
        thisSeq = [i]
        for j = 1:50
            i+=getPal(i)
            if i==getPal(i)
                isLych = false
                break
            elseif in(i,pSet)
                isLych = false
                break
            elseif in(i,lSet)
                break
            end
            push!(thisSeq,i)
        end
        for ts = thisSeq
            if isLych
                push!(lSet,ts)
            else
                push!(pSet,ts)
            end
        end
    end
    return length([l for l in lSet if l<10000])
end

println(main())