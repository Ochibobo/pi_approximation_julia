# pi_approximation_julia
A method to approximate Pi written in Julia (Serial and parallel executions)

To execute the code, follow these steps below:

On your terminal, run `julia -p n` where `n` is the number of processors you'd like this code to run on.

Import the following packages:<br>
`using Distributed`

Then, run `@everywhere include("pi_approximation_julia.jl")` <br>

To run the serial code, execute:<br>
`serial_pi(x)` where x is a large integer.

To run the parallel code, execute:<br>
`parallel_pi(x)` where x is a large integer.

To compare the 2, import `BenchmarkTools` first, then run `@btime serial_pi(x)` and `@btime parallel_pi(x)` to see the difference.
