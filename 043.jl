import Combinatorics.permutations

function main()
    out = 0
    divBy = [2 3 5 7 11 13 17]
    for s = permutations("0123456789",10)
        if s[1]!='0'
            possible = true
            s = join(s)
            for i=1:7
                if parse(Int16,s[i+1:i+3]) % divBy[i]!=0
                    possible = false
                    break
                end
            end
            if possible
                out+=parse(Int64,s)
            end
        end
    end
    return out
end

println(main())