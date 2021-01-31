ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function mark_field(r)
side=Ost
mark_row(r,side)
# ИНВАРИАНТ: горизонталный ряд с Роботом и все нижние ряды замаркированы (замаркированы все из доступные 
# клетки)
while isborder(r,side)==false
move!(r,Nord)
side=inverse(side)
mark_row(r,side)
end
#УТВ: Робот - у северной границы
end

function mark_row(r::Robot,side::HorizonSide)
putmarker!(r)
# ИНВАРИАНТ: клетка с Роботом и все ДОСТУПНЫЕ предыдущие в данном ряду (по ходу движения) замаркированы
while move_if_posible!(r,side) == true
putmarker!(r)
end
end
