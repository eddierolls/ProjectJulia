function main()
    count = 0
    for i = 23:100
        for j = 2:i
            if binomial(i,j)>10^6
                count += i - 2*j + 1
                break
            end
        end
    end
    return count
end

println(main())