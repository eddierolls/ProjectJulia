include("utils/primes.jl")

function main()
    primes = primesLessThan(10^7)
    allPandig = ["1" "12" "123" "1234" "12345" "123456" "1234567"]
    out = 0
    for p=reverse(primes)
        if in(join(sort(collect(string(p)))),allPandig)
            out = p
            break
        end
    end
    return out
end

println(main())