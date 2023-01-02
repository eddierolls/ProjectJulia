function primesLessThan(num)
    allPrimes = Int64[]
    isPrime = [false;trues(num-1)]
    for i=2:num
        if isPrime[i]
            push!(allPrimes,i)
            for j=i^2:i:num
                isPrime[j]=false
            end
        end
    end
    return allPrimes
end