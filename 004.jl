function isPalindrome(x)
    return string(x)==reverse(string(x))
end

function largestPalindrome(maxNum)
    out = 1
    for i=maxNum:-1:1
        if i^2<out
            break
        end
        for j=i:-1:max(1,out÷i)
            if isPalindrome(i*j)
                out = i*j
                break
            end
        end
    end
    return out
end

if isPalindrome(31) || !isPalindrome(121)
    error("isPalindrome function is broken")
end

if largestPalindrome(99)!=9009
    error("Tests failed")
end

println(largestPalindrome(999))
