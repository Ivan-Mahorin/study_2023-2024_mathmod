#case 1
# x'' + 30x = 0
using DifferentialEquations

function lorenz!(du, u, p, t)
    a = p
    du[1] = u[2]
    du[2] = -a*u[1]
end

const x = 0.0
const y = -0.6
u0 = [x, y]

p = (30)
tspan = (0.0, 77.0)
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plot(sol)
savefig("lab4_julia_1.png")

#фазовый портрет
plot(sol, vars=(2,1))
savefig("lab4_julia_1_ph.png")