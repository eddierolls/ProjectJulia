function num2bin(num)
    out = ""
    while num>0
        out = string(num%2) * out
        num = num ÷ 2
    end
    return out
end