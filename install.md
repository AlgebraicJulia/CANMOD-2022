# Learning Julia

The [Julia documentation](https://docs.julialang.org/en/v1/) is your go to resource. There are also [Learning Resources](https://julialang.org/learning/) available. 

Jane Herriman gave a great introduction to Julia on [youtube](https://www.youtube.com/watch?v=8h8rQyEpiZA). It is 2hr 24min and the tutorial materials are [on github](https://github.com/JuliaAcademy/JuliaTutorials).

# Programming Environment

## Installing Locally

If you prefer to run Julia locally, please follow the directions on the [Julia Downloads](https://julialang.org/downloads/) page. Make sure to install the current stable release v1.6.2. No other versions of julia will be supported in this class.

To install [graphviz](https://graphviz.org/download/), you can use the system package manager such as `sudo apt install graphviz` (Debian based Linux) or `brew install graphviz` (MacOS). Or these instructions on [windows](https://graphviz.org/download/#windows).

At this point you can install `IJulia` as above. Start a julia session and run `using Pkg; Pkg.add("IJulia");`.

## Connecting to HiPerGator

If for any reason, you can't install locally or you would like to gain experience in using a cluster computing resource, I have arranged HiPerGator resources for the class.

Make sure that you are on the campus network or vpn

1. Log in to JupyterHub at UF http://jhub.rc.ufl.edu/hub/spawn
2. Start a new terminal
3. Load the julia module by running `module load julia`
4. Start a julia session by running `julia`
5. Install the IJulia library, which we need to open julia notebooks in Jupyter. `using Pkg; Pkg.add("IJulia");` This will load the julia package manager library and then install the [IJulia.jl](https://github.com/JuliaLang/IJulia.jl) package. You can read more about [IJulia](https://julialang.github.io/IJulia.jl/stable/) in their documentation.
6. Because we are using HiPerGator's version of Jupyter, we might need to add a kernel for the latest version of Julia. The [instructions](https://julialang.github.io/IJulia.jl/stable/manual/installation/#Installing-additional-Julia-kernels) tell us to run the following commands in the Julia prompt.

```julia
using IJulia
installkernel("Julia")
```

7. Create a new notebook using your fresh Julia 1.6.2 kernel.

## Graphviz Support

In order to render diagrams we need to make sure that graphviz is installed on our computer. HiPerGator has a recent version of Graphviz installed using the module system. To access it, you will want to add this to your `~/.bashrc` file

```shell
module load julia
module load graphviz
```

You can test that graphviz is loaded by running `;dot -h` which should print out the help text for the graphviz `dot` command.

This will cause your load both the julia module and the graphviz module into your environment for every shell that you spawn.

If your notebook does not have the module loaded, you can run `;module load graphviz` from inside the notebook. Starting a line with a semicolon (`;`) tells julia to run that line with the system shell instead of the julia runtime. So if you want to access any functionality in the system shell you can always type `;cmd` to run the command `cmd` in the shell. This is handy when performing system tasks like manipulating files with `;ls`, `;mv`, `;rm`, and `;cp` or when performing git operations like `;git clone` or `;git commit` 

# Installing Catlab

Now that you have the Julia environment installed, we can install Catlab. You can access the julia package manager using two interfaces. 

1. The library access: `using Pkg; Pkg.add("Catlab")`
2. The `]` REPL mode: `] add Catlab`

Note on `Pkg.add` vs `Pkg.dev` in order to edit the source code of a library, you have to install that library in developement mode. This will clone the repository of the software and check out the primary developement branch.

1. Library access: `using Pkg; Pkg.develop("Catlab")`
2. Pkg-REPL mode: `]dev Catlab`

# Using Catlab

Now we can load up the Catlab library and start using it. The julia keyword `using` loads a module into the current namespace. When working in a notebook or REPL session, the current namespace is called `Main`. The following Catlab modules will be helpful for working with ACT concepts up to Ch 2 of our textbook.

```julia
using Catlab
using Catlab.Theories           # The Categorical Logic core of Catlab
using Catlab.Present            # Presenting algebraic structures
using Catlab.CategoricalAlgebra # Data Structures like FreeDiagrams
using Catlab.Graphics           # Generic Drawing APIs
using Catlab.Graphics.Graphviz  # Drawing with Graphviz
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

# Example Codes

Practice running Catlab code using the examples prepared for this class from the Catlab Documentation. The raw julia files are in the [repository](https://github.com/AlgebraicJulia/Catlab.jl/tree/master/docs/literate/sketches) and there are [rendered html versions](https://algebraicjulia.github.io/Catlab.jl/dev/generated/sketches/partitions/) in the Catlab [docs](https://algebraicjulia.github.io/Catlab.jl/dev/) 

1. Run the [Partitions Sketch](https://algebraicjulia.github.io/Catlab.jl/dev/generated/sketches/partitions/) and perform some additional computations on partitions. For example create a partition from an exercise in the textbook and define a refinement. Show that refinements compose using the `compose` function in Catlab.

2. Run the [Meets/Joins Sketch](https://algebraicjulia.github.io/Catlab.jl/dev/generated/sketches/meets/) and do the exercises listed there.