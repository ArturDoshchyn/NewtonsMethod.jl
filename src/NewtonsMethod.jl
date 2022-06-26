module NewtonsMethod

using ForwardDiff

function newtonroot(f, f′; x₀ = 0.0, tol = 1E-7, maxiter = 1000)
    i = 1
    xₙ = x₀
    xₙ₊₁ = xₙ - f(xₙ)/f′(xₙ)
    while abs(xₙ₊₁-xₙ) > tol && i < maxiter
        xₙ = xₙ₊₁
        xₙ₊₁ = xₙ - f(xₙ)/f′(xₙ)
        i += 1
    end
    if abs(xₙ₊₁-xₙ) > tol
        return nothing
    else
        return xₙ₊₁
    end
end

function newtonroot(f; x₀ = 0.0, tol = 1E-7, maxiter = 1000)
    f′(x) = ForwardDiff.derivative(f, x)
    return newtonroot(f, f′, x₀ = x₀, tol = tol, maxiter = maxiter)
end

end
