using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    @test newtonroot(x -> (x-1)^3, x -> 3(x-1)^2) ≈ 1.0 rtol=1E-5
    @test newtonroot(x -> (5x-4)^12, x -> 60(5x-4)^11) ≈ 0.8 rtol=1E-5
    @test newtonroot(x -> x^2, x -> 2x, x₀ = 1.0) ≈ 0.0 atol=1E-5
    @test newtonroot(x -> x^2, x -> 2x, x₀ = 1.0, maxiter = 5) == nothing
    @test newtonroot(x -> x^2, x -> 2x, x₀ = 1.0, tol = 1e-12) ≈ 0.0 atol=1e-12


    @test newtonroot(x -> (x-1)^3) ≈ 1.0 rtol=1E-5
    @test newtonroot(x -> (5x-4)^12) ≈ 0.8 rtol=1E-5
    @test newtonroot(x -> x^2, x₀ = 1.0) ≈ 0.0 atol=1E-5
    @test newtonroot(x -> x^2, x₀ = 1.0, maxiter = 5) == nothing
    @test newtonroot(x -> x^2, x₀ = 1.0, tol = 1e-12) ≈ 0.0 atol=1e-12
end
