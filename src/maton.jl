# to do: alt, ...

wm(w::WordType) = Maton(length(w) + 1,
                        Set([1]), Set([length(w) + 1]),
                        [(k,k + 1) for k in 1:length(w)],
                        [c for c in w])

botm() = Maton(0, Set{Int}(), Set{Int}(),
               Pair{Int,Int}[],
               eltype(ABET)[])

topm() = Maton(1, Set([1]), Set([1]),
               [(1,1) for _ in ABET],
               [c for c in ABET])

# alt requires a ren (for rename)
