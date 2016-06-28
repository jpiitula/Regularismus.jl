immutable Word<:SetEx w::WordType end
==(x::Word, y::Word) = x.w == y.w

macro wx_str(w)
    Word(w)
end

immutable BotS<:SetEx end
immutable TopS<:SetEx end

bots() = BotS()
tops() = TopS()

==(x::BotS, y::BotS) = true
==(x::TopS, y::TopS) = true

immutable AltS{S<:SetEx,T<:SetEx}<:SetEx a::S; b::T end
immutable CatS{S<:SetEx,T<:SetEx}<:SetEx a::S; b::T end
immutable IntS{S<:SetEx,T<:SetEx}<:SetEx a::S; b::T end

==(x::AltS, y::AltS) = x.a == y.a && x.b == y.b
==(x::CatS, y::CatS) = x.a == y.a && x.b == y.b
==(x::IntS, y::IntS) = x.a == y.a && x.b == y.b

alt(x1::SetEx, x2::SetEx, xs...) = (isempty(xs) ? AltS(x1, x2)
                                    : AltS(x1, alt(x2, xs...)))

cat(x1::SetEx, x2::SetEx, xs...) = (isempty(xs) ? CatS(x1, x2)
                                    : CatS(x1, cat(x2, xs...)))

int(x1::SetEx, x2::SetEx, xs...) = (isempty(xs) ? IntS(x1, x2)
                                    : IntS(x1, int(x2, xs...)))

immutable StarS{S<:SetEx}<:SetEx a::S end
immutable PlusS{S<:SetEx}<:SetEx a::S end

==(x::StarS, y::StarS) = x.a == y.a
==(x::PlusS, y::PlusS) = x.a == y.a

star(x::SetEx) = StarS(x)
plus(x::SetEx) = PlusS(x)
