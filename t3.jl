function mark_pole!(r)
    s1=Ost
    s2=Nord
    kolvo_shagov=go_to_corner!(r,s1,s2)
    mark_zmeikoi!(r,s1,s2)
    go_to_corner!(r,s1,s2)
    go_back!(r,s1,s2,kolvo_shagov)
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

function mark_zmeikoi!(r,s1,s2)
    while !isborder(r,inverse(s1))
        mark_line!(r,inverse(s2))
        move!(r,inverse(s1))
        s2=inverse(s2)
    end
    mark_line!(r,inverse(s2))
end

function mark_line!(r,s2)
    putmarker!(r)
    while !isborder(r,s2)
        move!(r,s2)
        putmarker!(r)
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

inverse(s)=HorizonSide((Int(s)+2)%4)

mark_pole!(r)