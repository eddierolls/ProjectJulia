function main(seqLen=100)
    seq = [2,1]
    for i=1:333
        push!(seq,2*i)
        push!(seq,1)
        push!(seq,1)
    end
    seq = seq[1:seqLen]
    num = BigInt(seq[seqLen])
    den = BigInt(1)
    for i=seqLen-1:-1:1
        num,den = den,num
        num += den*seq[i]
        fac = gcd(num,den)
        num÷=fac
        den÷=fac
    end
    println(num)
    out = sum([parse(Int16,s) for s=string(num)])
    return out
end

println(main(100))