using Pkg
Pkg.status()
Pkg.add("Plots")
Pkg.update()
Pkg.status()

# ] add OrdinaryDiffEq

# Variables 

a = 1
b = 2
c = a + b

# Printing

println(a)
println("a = $a")
println("a+b = $(a+b)")

# Functions

function f(x)
    return x + 2
end
g(x) = 2x
threex = x -> 3x

h = f∘g

h(10)

h′ = g∘f

h′(10)


threex(2)


# Booleans and Logical operators

3 == 3
3 != 4

1 <= 2
1 < 2 < 3

1 ≤ 2

"a" < 2

# Conditionals
a = 3
if a == 2
    println("a == 2")
elseif a < 2
    println("a < 2")
else
    println("a > 2")
end

# short circuiting

a, b, c, d = 3,4,2,2
a == b || c == d
a == b || "made it"
c == d || "made it"

a == b && "made it"
c == d && "made it"

# used for error handling

c == d && error("c should not equal d")

# Asserts and Testing

threex(2) == 6

@assert threex(2) == 6

using Test
@test threex(2) == 6

@testset "Test1" begin
    @test threex(2) == 6
end

# Julia requires conditionals to be Bool. No "Truthy/Falsey"

nilstring = ""
if nilstring
    println("nil")
else
    println("notnil")
end

if nilstring == ""
    println("nil")
else
    println("notnil")
end

# Nothing is the programmers nil 

println(nothing)
isnothing(nothing)
isnothing("")

# Missing is the statisticians N/A
Missing()

[1, 2, Missing(), 4]

# Arrays

v = [1,2,3,5]

rowv = [1 2 3 5]

vcat(v,v)
hcat(v,v)

vcat(rowv, rowv)

hcat(rowv, rowv)

rowv'

# collect forces any type to Array

collect(rowv')


# Loops and broadcasting

for i in 1:4
    @show i, v[i]
end

for (i, x) in enumerate(v)
    @show i, x
end

# arithmetic automatically broadcasts over arrays.

2v + v

# you can broadcast any function with the point syntax.

2 .* v .+ v
[1,2,3,4]    .+ [5 6 7]
2 .* [5 6 7] .+ [1,2,3,4]

sin.((1:10)/2π)

# map and fold

map(x->2x, 1:10)
foldl(+, 1:10)

map(1:10) do x
    2x
end

# indexing Arrays

v[3] == 3

# mutating Arrays
v[1] = 1

# array syntax is just syntax for functions https://docs.julialang.org/en/v1/manual/functions/#Operators-With-Special-Names

# adding entries with push!
push!(v, 6)
push!(v, 6)

# Randomness

using Random

r = rand()
r10 = rand(10)
rnormal = randn()
rnormal10 = randn(10)
binrand = rand(Bool, 10)
catrand = rand(1:3, 10)

# Tuples
p = (1,2)
p[1]
p[2]

for x in p
    println(x)
end

function f(x,y)
    return x + y, x*y
end

f(2,3)
f(p...)

# Types

v = [1,2,3]
typeof(v)
eltype(v)

w = v .+ 1.0
typeof(w)
eltype(w)

push!(w, Missing())
vcat(w, [Missing()])

𝟙₂₃ = ones(Float64, 2,3)
typeof(𝟙₂₃)
eltype(𝟙₂₃)



Rational{Int64}
Rational{Int8}(2,3)
Rational{Int8}(2,30)
Rational{Int8}(2,254)
Rational{Int8}(2,256)

struct MyRat{T}
    num::T
    den::T
end

MyRat(2,4)

myrat(x::Int,y::Int) = begin
    @show d = gcd(x,y)
    MyRat(div(x,d), div(y,d))
end

myrat(2,4)

# Plotting

using Plots
domₓ = (-10:10)/2π
codₛ = sin.(domₓ)
plot(domₓ,codₛ)
plot(domₓ,codₛ, line=:scatter)

# more tutorials for plots 
# https://docs.juliaplots.org/stable/tutorial/
# https://github.com/JuliaPlots/StatsPlots.jl
# https://diffeq.sciml.ai/dev/basics/plot/

# For differences from R or Python see this list
# https://docs.julialang.org/en/v1/manual/noteworthy-differences/

# DiffEQ Solving

using OrdinaryDiffEq
f(u,p,t) = 1.01*u
u0 = 1/2
tspan = (0.0,1.0)
prob = ODEProblem(f,u0,tspan)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

using Plots
plot(sol,linewidth=5,title="Solution to the linear ODE with a thick line",
     xaxis="Time (t)",yaxis="u(t) (in μm)",label="My Thick Line!") # legend=false
plot!(sol.t, t->0.5*exp(1.01t),lw=3,ls=:dash,label="True Solution!")
