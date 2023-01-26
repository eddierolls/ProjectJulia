function powerMod(x,y,k)
    # x to the power of y mod k
    if typemax(Int)<BigInt(k)^2
        k = BigInt(k)
    end
    out = 1
    while y>0
        if y%2==1
            out = (x*out) % k
        end
        y>>=1 # bitshift one space
        x = (x*x) % k
    end
    return out
end

