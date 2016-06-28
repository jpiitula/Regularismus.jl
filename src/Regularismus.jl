module Regularismus

import Base: ==, hash, cat, int
export @wx_str, rx
export bots, tops, alt, star, plus
export botr, topr
export botm, topm, botd, topd
export mac

typealias WordType ASCIIString
const ABET = Set("abcd")
const NULL = 'e'

@assert typeof(NULL) == eltype(ABET)
@assert !(NULL in ABET)

include("Ex.jl")

include("mac.jl")

end
