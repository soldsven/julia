function mark_krest(r)
    for s in [Nord,West,Sud,Ost]
    put_markers(r,s)
    move_back(r,inverse(s))
    end
    putmarker!(r)
end

function put_markers(r,s)
    while !isborder(r,s)
        move!(r,s)
        putmarker!(r)
    end
end

function move_back(r,s)
    while ismarker(r)
        move!(r,s)
    end
end

include("roblib.jl")

mark_krest(r)
