function main()
    dayOfWeek = 1
    totalCount = 0
    for yr = 1900:2000
        for mth = 1:12
            if in(mth,Int8[4,6,9,11])
                mthLen = 30
            elseif mth==2 && (yr==1900 || (yr%4)!=0)
                mthLen = 28
            elseif mth==2
                mthLen = 29
            else
                mthLen = 31
            end
            dayOfWeek = (dayOfWeek + mthLen) % 7
            if dayOfWeek==0 && yr>=1901
                totalCount+=1
            end
        end
    end
    return totalCount
end

println(main())