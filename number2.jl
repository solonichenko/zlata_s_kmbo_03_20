ENV["MPL BACKEND"]="TkAgg"
using HorizonSideRobots
using PyPlot
pygui(true)
sides = (Nord, Sud, Ost, West)
function inverseSide(side::HorizonSide)
return HorizonSide(mod(Int(side)+2, 4))
end

function main(m::Robot)
    stepWest = moveSide(m, West)
    stepNord = moveSide(m, Nord)
    sides = (Ost, Sud, West, Nord, Ost)
for side in sides
    while isborder(m, side) != true
          if ismarker(m)
             followByCount(m, Ost, stepWest)
             followByCount(m, Sud, stepNord)
                          return true
          end
             moveSide(m, side, true)
          end
     end
end
             function moveStep(m::Robot, side::HorizonSide, mark::Bool)
                      if mark
                         putmarker!(m)
                      end
                move!(m, side)
             end

function moveSide(m::Robot, side::HorizonSide, mark=false)
    step = 0
    while isborder(m, side)!= true
        moveStep(m, side, mark)
        step += 1
    end
    return step
end

function followByCount(m::Robot, side::HorizonSide, number::Int)
    for k = 0:number-1
        moveStep(m, side, false)
    end
end
