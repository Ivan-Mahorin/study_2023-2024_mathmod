#case 3
# x'' + 17x' + 3x = 0.9cos(10t)
using DifferentialEquations

function lorenz!(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] + 0.9*cos(10*t)
end

const x = 0
const y = -0.6
u0 = [x, y]

p = (sqrt(17), 3)
tspan = (0.0, 77.0)
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plot(sol)
savefig("lab4_julia_3.png")

#фазовый портрет
plot(sol, vars=(2,1))
savefig("lab4_julia_3_phase.png")