ARRSIZE = 20
arr = Array{Int8}(undef,20,20)
open("inputs/011.txt") do file
    i = 1
    for line in eachline(file)
        line = map(x-> parse(Int8,x),split(line))
        arr[:,i] = line
        i+=1
    end
end

maxProd = 0
for i = 1:ARRSIZE
    for j = 1:ARRSIZE
        if i<=ARRSIZE-3
            global maxProd = max(maxProd,prod(arr[i:i+3,j]))
        end
        if j<=ARRSIZE-3
            global maxProd = max(maxProd,prod(arr[i,j:j+3]))
        end
        if i<=ARRSIZE-3 && j<=ARRSIZE-3
            ind = [CartesianIndex(i+x,j+x) for x=0:3]
            global maxProd = max(maxProd,prod(arr[ind]))
        end
        if i>=4 && j<=ARRSIZE-3
            ind = [CartesianIndex(i-x,j+x) for x=0:3]
            global maxProd = max(maxProd,prod(arr[ind]))
        end
    end
end
println(maxProd)