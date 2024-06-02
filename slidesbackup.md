---
theme: seriph
background: https://source.unsplash.com/collection/94734566/1920x1080
class: text-center
highlighter: shiki
lineNumbers: false
drawings:
  persist: false
defaults:
  foo: true
transition: slide-left
title: Introduction to Julia for education
mdc: true
---

<div style="background: white; opacity:0.9; border-radius: 20px; padding:20px">

<div style="color: #000E55">

# Introduction to Julia for education

Pere Giménez

pere@genieframework.com
</div>
</div>

<style>

</style>

---
clicks: 8
---

# What is Julia?

<v-clicks>

- Julia is an open source functional programming language specially designed for scientific computing.
- Created at MIT in 2012, now backed by JuliaHub.
- Combines the speed of C with the expressiveness of Python and the math-friendly syntax of MATLAB.
- Conceptually it's like a scripting language, but with JIT compilation to machine code.
- Code runs interactively in the terminal, in a notebook, or as a standalone application.

</v-clicks>


<v-click>
```julia
A = [1 2; 3 4]  # Define a 2x2 matrix
b = [5; 6]      # Define a vector
x = A \ b       # Solve the linear system Ax = b
println("Solution of Ax = b: ", x)
eigvals = eigvals(A)  # Calculate eigenvalues of A
println("Eigenvalues of A: ", eigvals)

```
</v-click>

<v-clicks>

- Solves the two-language problem: it's fast, so you won't need to write costly computations in C.
- Packages are usually 100% written in Julia, making it easier to read their code and contribute.

</v-clicks>

---
clicks: 8
---

# Key language features

<v-clicks>

- Vector syntax that makes sense.

```julia
y = ones(10); A = randn(10,10)
y = x'*A*x

```

- Any symbol can be used to define a variable.

```julia
β = 8 / 3; 🐼 = "panda"
```

- Dead-easy parallel and distributed computing.

```julia
addprocs(4)
result = @distributed (append!) for i = 1:10
    i^2
end
```


- Seamless integration with Python via PyCall.jl

```julia
using PyCall
math = pyimport("math")
math.sin(math.pi / 4) # returns ≈ 1/√2 = 0.70710678...
```

- Excellent package manager with per-application package versions

</v-clicks>

---


# Key language features

<v-clicks>

- Extensive type system

```julia
abstract type Animal end
struct Dog <: Animal
    legs::Int
end
```

- Multiple dispatch
```julia
f(x::Float64, y::Float64) = println("Adding two Floats: ", x + y)
f(x::Int, y::Int) = println("Adding two Ints: ", x + y)

f(2.0, 3.0) # returns 5.0
f(2, 3) # returns 5
```


- Powerful metaprogramming enables domain-specific languages

```julia
 @parameters t σ ρ β
 @variables x(t) y(t) z(t)
 D = Differential(t)
 eqs = [D(x) ~ σ * (y - x),
     D(y) ~ x * (ρ - z) - y,
     D(z) ~ x * y - β * z]
 @named sys = ODESystem(eqs)
```

</v-clicks>

---
clicks: 8
---

# Julia for teaching

<v-clicks>

- Julia is widely used in research and academic environments, and it's growing in industry.
- Syntax makes it easier to stay close to math concepts
- Package ecosystem is smaller than Python's but main packages have high quality
    - DataFrames for data wrangling
    - JuMP for convex optimization
    - Flux for deep learning, MLJ for general machine learning
    - DifferentialEquations for ODEs, PDEs, etc
    - Plots for plotting, Makie for complex and performant visualizations
    - Genie for web development
- Jupyter notebooks can also run Julia code (Ju stands for Julia)
- Pluto.jl brings interactive notebooks suited for classroom usage
- Code in a notebook can be imported into other apps as is

</v-clicks>

---


<iframe src="https://featured.plutojl.org/math/convolution_2d.html" style="transform: scale(0.7);transform-origin: 0 0;" width="1300" height="900"/>

---

<iframe src="https://computationalthinking.mit.edu/Fall23/homework/hw9/" style="transform: scale(0.7);transform-origin: 0 0;" width="1300" height="900"/>

---

# Building interactive web apps with Genie

As a more powerful option while still being easy to implement and use, you can turn your scientific code into an interactive Genie web app. With this you can:

<v-clicks>

- Integrate many sorts of visualizations and interactivity provided by web technologies.
- Easily write the app's logic with Genie's elegant reactive API, and design the UI with Genie Builder's no-code editor.
- Leverage the power of the full stack Genie Framework, making your app highly scalable.
- Deploy the app online and share it with anyone with just a link.
</v-clicks>

---

<video src="/travel.mp4"  width="100%"  controls/>

---

<video src="/lorenz.mp4"  width="100%"  controls/>

---

<video src="/odefullapp.mp4"  width="100%"  controls/>

---


# Additional resources

- Installation https://julialang.org/downloads/
- Documentation https://docs.julialang.org/en/v1/manual/getting-started/
- Julia Discourse https://discourse.julialang.org/
- Slack channel https://julialang.org/slack/
- Pluto notebooks https://featured.plutojl.org/
- Genie Framework https://genieframework.com
- **Julia Meetup at Norrsken House (next to W hotel) on April 11th**
    - https://www.meetup.com/es-ES/barcelona-julia-meetup/


