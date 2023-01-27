function main()
    out = 0
    for i=2:8
        for num = 10^(i-1):(10^i)÷6
            digs = join(sort(collect(string(num))))
            same = true
            for j = 2:6
                if digs!=join(sort(collect(string(num*j))))
                    same = false
                    break
                end
            end
            if same
                out = num
                break
            end
        end
        if out>0
            break
        end
    end
    return out
end

println(main())