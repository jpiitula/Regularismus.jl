using Regularismus
using Base.Test

type countertype
  pass::UInt
  fail::UInt
end
counter = countertype(0, 0)

function verbose_handler(r::Test.Success)
    counter.pass += 1
    println("PASS ", r.expr)
end
function verbose_handler(r::Test.Failure)
    counter.fail += 1
    println("FAIL ", r.expr, " : ", r.resultexpr)
end
verbose_handler(r::Test.Error) = rethrow(r)

silent_handler(r::Test.Success) = counter.pass += 1
silent_handler(r::Test.Failure) = counter.fail += 1
silent_handler(r::Test.Error) = rethrow(r)

Test.with_handler(verbose_handler) do
    @test bots() == bots()
    @test wx"" == wx""
    @test alt(wx"", bots(), tops()) == alt(wx"", bots(), tops())
    @test cat(bots(), tops()) == cat(bots(), tops())
    @test int(star(bots()), tops()) == int(star(bots()), tops())
    @test plus(bots()) == plus(bots())
    @test botr() == botr()
    @test rx(wx"", wx"") == rx(wx"", wx"")
    @test alt(botr(), topr()) == alt(botr(), topr())
    @test cat(botr(), topr()) == cat(botr(), topr())
    @test star(botr()) == star(botr())
    @test plus(botr()) == plus(botr())
end

if counter.fail == 0
    info("Tests PASS: ", counter.pass)
    info("All tests pass")
elseif counter.pass == 0
    info("No tests run")
else
    info("Tests PASS: ", counter.pass)
    info("Tests FAIL: ", counter.fail)
    info("Some tests pass")
end
