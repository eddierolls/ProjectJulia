function evenFibSum(maxNum)
    last1,last2 = (1,1)
    allFib = 0
    while last1<=maxNum
        (last1,last2) = ((last1+last2),last1)
        if last1%2==0
            allFib += last1
        end
    end
    return allFib
end

if evenFibSum(10)!=10
    error("Tests failed")
end
println(evenFibSum(4*10^6))