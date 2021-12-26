function mark_pyramide!(r)
    s1=Sud
    s2=West
    kolvo_shagov=go_to_corner!(r,s1,s2)
    horizont=shet_hor!(r)
    pyramide!(r,horizont)
    go_to_corner!(r,s1,s2)
    go_back!(r,s1,s2,kolvo_shagov)
end

function shet_hor!(r)
    schet=1
    while !isborder(r,Ost)
        move!(r,Ost)
        schet+=1
    end
    while !isborder(r,West) 
        move!(r,West) 
    end
    return schet
end

function pyramide!(r,horizont)
    while !isborder(r,Nord)
        putmarker!(r)
        horizont=horizont-1
        for i in 1:horizont
            move!(r,Ost)
            putmarker!(r)
        end
        move!(r,Nord)
        while !isborder(r,West) 
            move!(r,West) 
        end
    end
    putmarker!(r)
    for i in 2:horizont
        move!(r,Ost)
        putmarker!(r)
    end
end

mark_pyramide!(r)