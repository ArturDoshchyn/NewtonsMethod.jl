module NewtonsMethod

using ForwardDiff

function newtonroot(f, f′; x₀ = nothing, tol = 1E-7, maxiter = 1000)
    #check if x₀ is set
    if isnothing(x₀)
        x₀ = 0.0
        println("No x₀ given. x₀ = $x₀ is set.")
    end

    #now onto the algorithm
    i = 1
    xₙ = x₀
    xₙ₊₁ = xₙ - f(xₙ)/f′(xₙ)
    while abs(xₙ₊₁-xₙ) > tol && i < maxiter
        xₙ = xₙ₊₁
        xₙ₊₁ = xₙ - f(xₙ)/f′(xₙ)
        i += 1
    end

    #Check if converged and no NaN (e.g. if division by 0)
    if abs(xₙ₊₁-xₙ) > tol || isnan(xₙ₊₁)
        println("Convergence failed")
        return nothing
    else
        println("Converged in $i iterations")
        return xₙ₊₁
    end
end

function newtonroot(f; x₀ = nothing, tol = 1E-7, maxiter = 1000)
    println("No f′ is given. ForwardDiff is used.")
    f′(x) = ForwardDiff.derivative(f, x)
    return newtonroot(f, f′, x₀ = x₀, tol = tol, maxiter = maxiter)
end

export newtonroot

end
