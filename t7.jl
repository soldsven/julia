function chess_mark!(r) 
    global flag
    kolvo_shagov=go_to_corner!(r,Sud,West)
    chess_mark(r,Sud,West,kolvo_shagov)
    go_to_corner!(r,Sud,West)
    go_back!(r,Sud,West,kolvo_shagov)
end

function go_to_corner!(r,s1,s2)
    count_steps1=0
    count_steps2=0
    while !isborder(r,s1) || !isborder(r,s2)
        while !isborder(r,s1)
            move!(r,s1)
            count_steps1+=1
        end
        while !isborder(r,s2)
            move!(r,s2)
            count_steps2+=1
        end
    end
    return (count_steps1,count_steps2)
end

function chess_mark(r,s1,s2,kolvo_shagov)

    if (kolvo_shagov[1]+ kolvo_shagov[2])%2 == 0
        marker_sw = true
    else 
        marker_sw = false
    end

    global flag = marker_sw

    mark_line(r,inverse(s2))



    while !isborder(r,inverse(s1))
        move!(r,inverse(s1))
        flag = !flag
        mark_line(r,s2)
        s2=inverse(s2)
    end

end

function mark_line(r,s)
    global flag
    if flag == true
        putmarker!(r)
    end
    while !isborder(r,s)
        move!(r,s)
        flag = !flag
        if flag == true
            putmarker!(r)  
        end  
    end
end

function go_back!(r,s1,s2,kolvo_shagov)
    for i in 1: kolvo_shagov[2]
        move!(r,inverse(s2))
    end
    for i in 1: kolvo_shagov[1]
        move!(r,inverse(s1))
    end
end

chess_mark!(r)