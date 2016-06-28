immutable Maton
    n::Int
    inis::Set{Int}
    finis::Set{Int}
    over::Vector{Pair{Int,Int}}
    by::Vector{eltype(ABET)}
end

immutable Ducer
    n::Int
    inis::Set{Int}
    finis::Set{Int}
    over::Vector{Pair{Int,Int}}
    by::Vector{Pair{eltype(ABET),eltype(ABET)}}
end

include("maton.jl")

include("ducer.jl")

mac(x::Word) = wm(x.w)

mac(x::BotS) = botm()
mac(x::TopS) = topm()

mac(x::AltS) = alt(mac(x.a), mac(x.b))
mac(x::CatS) = cat(mac(x.a), mac(x.b))
mac(x::IntS) = int(mac(x.a), mac(x.b))

mac(x::StarS) = star(mac(x.a))
mac(x::PlusS) = plus(mac(x.a))

mac(x::BotR) = botd()
mac(x::TopR) = topd()

mac(x::AltR) = alt(mac(x.a), mac(x.b))
mac(x::CatR) = cat(mac(x.a), mac(x.b))

mac(x::StarR) = star(mac(x.a))
mac(x::PlusR) = plus(mac(x.a))
