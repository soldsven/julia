function poisk_prohoda(r)
    steps = 0
    steps_back = 0
    while isborder(r,Nord)
        for i in 0:steps
            move!(r,Ost)    
        end
        if !isborder(r,Nord) 
            break
        end
        steps_back = steps+1
        for i in 0:steps_back
            move!(r,West)
        end
        steps+=2
    end
end

poisk_prohoda(r)