immutable Reword<:RelEx hi::Word; lo::Word end
==(x::Reword, y::Reword) = x.hi == y.hi && x.lo == y.lo

rx(hi::Word, lo::Word) = Reword(hi, lo)

immutable BotR<:RelEx end
immutable TopR<:RelEx end

==(x::BotR, y::BotR) = true
==(x::TopR, y::TopR) = true

botr() = BotR()
topr() = TopR()

immutable AltR{S<:RelEx,T<:RelEx}<:RelEx a::S; b::T end
immutable CatR{S<:RelEx,T<:RelEx}<:RelEx a::S; b::T end

==(x::AltR, y::AltR) = x.a == y.a && x.b == y.b
==(x::CatR, y::CatR) = x.a == y.a && x.b == y.b

alt(x1::RelEx, x2::RelEx, xs...) = (isempty(xs) ? AltR(x1, x2)
                                    : AltR(x1, alt(x2, xs...)))

cat(x1::RelEx, x2::RelEx, xs...) = (isempty(xs) ? CatR(x1, x2)
                                    : CatR(x1, cat(x2, xs...)))

immutable StarR{T<:RelEx}<:RelEx a::T end
immutable PlusR{T<:RelEx}<:RelEx a::T end

==(x::StarR, y::StarR) = x.a == y.a
==(x::PlusR, y::PlusR) = x.a == y.a

star(x::RelEx) = StarR(x)
plus(x::RelEx) = PlusR(x)
