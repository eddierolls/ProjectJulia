function main()
    allPoly = [[n*(  n+1)÷2 for n=1:200 if n*(  n+1)÷2<10000 && n*(  n+1)÷2>=1000 && (n*(  n+1)÷2)%100>=10],
               [n*(  n  )   for n=1:200 if n*(  n  )  <10000 && n*(  n  )  >=1000 && (n*(  n  )  )%100>=10],
               [n*(3*n-1)÷2 for n=1:200 if n*(3*n-1)÷2<10000 && n*(3*n-1)÷2>=1000 && (n*(3*n-1)÷2)%100>=10],
               [n*(2*n-1)   for n=1:200 if n*(2*n-1)  <10000 && n*(2*n-1)  >=1000 && (n*(2*n-1)  )%100>=10],
               [n*(5*n-3)÷2 for n=1:200 if n*(5*n-3)÷2<10000 && n*(5*n-3)÷2>=1000 && (n*(5*n-3)÷2)%100>=10],
               [n*(3*n-2)   for n=1:200 if n*(3*n-2)  <10000 && n*(3*n-2)  >=1000 && (n*(3*n-2)  )%100>=10]]
    polyMap = Dict(i=>[[],[],[],[],[],[]] for i=10:99)
    for i=1:6
        for p=allPoly[i]
            push!(polyMap[p÷100][i],p)
        end
    end
    out = nothing
    for p1=allPoly[end]
        thisState = [[p1,[nothing,nothing,nothing,nothing,nothing,p1]]]
        while length(thisState)>0
            nextState = []
            for (p,visited)=thisState
                if !in(nothing,visited) && (p%100 == p1÷100)
                    out = sum(visited)
                    break
                end
                for i=1:5
                    if visited[i]==nothing
                        for nextP = polyMap[p%100][i]
                            thisVisited = copy(visited)
                            thisVisited[i] = nextP
                            push!(nextState,[nextP,thisVisited])
                        end
                    end
                end
            end
            thisState = nextState
        end
        if out!=nothing
            break
        end
    end
    return out
end

println(main())