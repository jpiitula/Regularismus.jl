# todo: wd, botd, topd, alt, ...

wd(w::WordType) = Ducer(length(w) + 1,
                        Set([1]), Set([length(w) + 1]),
                        [(k,k + 1) for k in 1:length(w)],
                        [(c,c) for c in w])

# wd(hi::WordType, lo::WordType) needs padding - - -

botd() = Ducer(0, Set{Int}[], Set{Int}[],
               Pair{Int,Int}[],
               Pair{eltype(ABET),eltype(ABET)}[])

# topd() = Ducer(...) can be done in different ways -
# what to do? two states, first hi,then lo?

topd() = Ducer(2, [1], [2],
               vcat([(1,1) for _ in ABET], [(1,2)],
                    [(2,2) for _ in ABET]),
               vcat([(c,NULL) for c in ABET], [(NULL,NULL)],
                    [(NULL,c) for c in ABET]))
