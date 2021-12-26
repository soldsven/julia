function mark_corner(r)
    s1=Sud
    s2=West
    mvs=[]
    go_to_corner!(r,s1,s2,mvs)
    mark_corners(r,s1,s2)
    go_back(r,mvs)
end

function go_to_corner!(r,s1,s2,mvs)
    while !isborder(r,s1) || !isborder(r,s2)
        move_if_possible!(r,s1,mvs)
        move_if_possible!(r,s2,mvs)
    end
end

function mark_corners(r,s1,s2)
    for s in (inverse(s2),inverse(s1),s2,s1)
        while !isborder(r,s)
            move!(r,s)
        end
        putmarker!(r)
    end
end

mark_corner(r)