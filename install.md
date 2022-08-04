# Getting started with AlgebraicJulia

## Learning Julia

The [Julia documentation](https://docs.julialang.org/en/v1/) is your go to resource. There are also [Learning Resources](https://julialang.org/learning/) available. 

Jane Herriman gave a great introduction to Julia on [youtube](https://www.youtube.com/watch?v=8h8rQyEpiZA). It is 2hr 24min and the tutorial materials are [on github](https://github.com/JuliaAcademy/JuliaTutorials).

## Programming Environment

To install Julia, please follow the directions on the [Julia Downloads](https://julialang.org/downloads/) page. Make sure to install the current stable release v1.7.3. No other versions of julia will be supported in this class.

To install [Graphviz](https://graphviz.org/download/), you can use the system package manager such as `sudo apt install graphviz` (Debian based Linux) or `brew install graphviz` (MacOS). Or these instructions on [Windows](https://graphviz.org/download/#windows).

At this point you can install `IJulia` as above. Start a julia session and run `using Pkg; Pkg.add("IJulia");`. 

## Installing Catlab

Now that you have the Julia environment installed, we can install Catlab. You can access the julia package manager using two interfaces. 

1. The library access: `using Pkg; Pkg.add("Catlab")`
2. The `]` REPL mode: `] add Catlab`

Note on `Pkg.add` vs `Pkg.dev` in order to edit the source code of a library, you have to install that library in development mode. This will clone the repository of the software and check out the primary development branch.

1. Library access: `using Pkg; Pkg.develop("Catlab")`
2. Pkg-REPL mode: `]dev Catlab`

## Using Catlab

Now we can load up the Catlab library and start using it. The julia keyword `using` loads a module into the current namespace. When working in a notebook or REPL session, the current namespace is called `Main`. The following Catlab modules will be helpful for working with ACT concepts up to Ch 2 of our textbook.

```julia
using Catlab
using Catlab.Theories           # The Categorical Logic core of Catlab
using Catlab.CategoricalAlgebra # Data Structures like FreeDiagrams
using Catlab.Graphics           # Generic Drawing APIs
using Catlab.WiringDiagrams     # Section 2.2
```

Then you can start creating data structures and running functions on them.

```julia
@present P(FreeSchema) begin
    (A,B,C,D)::Ob
    ab::Hom(A,B)
    ac::Hom(A,C)
    cd::Hom(C,D)
    bd::Hom(B,D)
end

d = FreeDiagram(P)

to_graphviz(d)
```

## Example Codes

Practice running Catlab code using the examples prepared for this class from the Catlab Documentation. The raw julia files are in the [repository](https://github.com/AlgebraicJulia/Catlab.jl/tree/master/docs/literate/sketches) and there are [rendered html versions](https://algebraicjulia.github.io/Catlab.jl/dev/generated/sketches/partitions/) in the Catlab [docs](https://algebraicjulia.github.io/Catlab.jl/dev/) 

1. Run the [Partitions Sketch](https://algebraicjulia.github.io/Catlab.jl/dev/generated/sketches/partitions/) and perform some additional computations on partitions. For example create a partition from an exercise in the textbook and define a refinement. Show that refinements compose using the `compose` function in Catlab.

2. Run the [Meets/Joins Sketch](https://algebraicjulia.github.io/Catlab.jl/dev/generated/sketches/meets/) and do the exercises listed there.
