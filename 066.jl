include("utils/continuedFractions.jl")

function isSquare(num)
    return num^0.5==round(num^0.5)
end

# Well over a minute; ALSO WRONG
function bruteForce()
    Drem = Set([x for x=1:1000 if !isSquare(x)])
    iS = 1
    sq = 1
    while length(Drem)>1 && sq>0
        sq = iS^2
        for d = Drem
            if isSquare(sq*d+1)
                delete!(Drem,d)
            end
        end
        iS+=1
    end
    if length(Drem)==1
        println(iS)
        return pop!(Drem)
    end
end

# Inspired by https://mathworld.wolfram.com/PellEquation.html
function main()
    maxD = 0
    maxX = 0 
    for D=[x for x=1:1000 if !isSquare(x)]
        cf = getContinuedFraction(D)
        a0 = cf[1]
        cf = cf[2:end]
        if (length(cf)-1)%2==1
            endSeq = length(cf)-2
        else
            endSeq = 2*(length(cf)-1)
        end
        cf = vcat(cf,cf)
        p = [BigInt(a0),BigInt(a0*cf[1]+1)]
        q = [BigInt(1),BigInt(cf[1])]
        for i=1:endSeq
            push!(p,cf[i+1]*p[end]+p[end-1])
            push!(q,cf[i+1]*q[end]+q[end-1])
        end
        if p[end]>maxX
            maxX = p[end]
            maxD = D
        end
        println((D,p[end],q[end]))
    end
    return maxD
end

println(main())