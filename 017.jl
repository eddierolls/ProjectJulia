function numMap(num)
    wordMap = Dict(1=>"One",2=>"Two",3=>"Three",4=>"Four",5=>"Five",
                   6=>"Six",7=>"Seven",8=>"Eight",9=>"Nine",10=>"Ten",
                   11=>"Eleven",12=>"Twelve",13=>"Thirteen",14=>"Fourteen",15=>"Fifteen",
                   16=>"Sixteen",17=>"Seventeen",18=>"Eighteen",19=>"Nineteen",
                   20=>"Twenty",30=>"Thirty",40=>"Forty",50=>"Fifty",
                   60=>"Sixty",70=>"Seventy",80=>"Eighty",90=>"Ninety",
                   0=>"")
    out = wordMap[num]
end

function num2words(num)
    if num==1000
        out = "OneThousand"
    elseif num>=100
        sep = ifelse(num%100==0,"","And")
        out = numMap(num÷100) * "Hundred" * sep * num2words(num%100)
    elseif num>=20
        out = numMap(num-(num%10)) * numMap(num%10)
    elseif num>=0
        out = numMap(num)
    else
        error("Number not recognised")
    end
    return out
end

if length(num2words(342))!=23 || length(num2words(115))!=20
    error("Tests Failed")
else
    println(sum([length(num2words(x)) for x in 1:1000]))
end
