include("utils./primes.jl")

tri = 1
x = 1
while divisorCount(tri)<500
    global x+=1
    global tri+=x
end

println(tri)