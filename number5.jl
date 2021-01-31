ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
function inverseSide(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2, 4))
end

function main(m::Robot)
    path = goToTheCorner(Sud, West)
    goToTheCorner(Nord, West)
    goToTheCorner(Nord, Ost)
    goToTheCorner(Sud, Ost)
end

function goToTheCorner(sideOne::HorizonSide, sideTwo::HorizonSide)
    pathBack = []
    while isborder(m, sideOne) != true || isborder(m, sideTwo) != true
        stepX = moveSide(m, sideOne)
        stepY = moveSide(m, sideTwo)
        push!(pathBack, [inverseSide(sideOne), stepX])
        push!(pathBack, [inverseSide(sideTwo), stepY])
    end
                    putmarker!(m)
            for item in pathBack[end:-1:1]
                   follownumber(m, item[1], item[2])
            end
end

             function moveSide(m::Robot, side::HorizonSide, mark=false)
                       step = 0
                 while isborder(m, side) != true
                     moveStep(m, side, mark)
                     step += 1
                 end
                        return step
             end
  function moveStep(m::Robot, side::HorizonSide, mark::Bool)
               move!(m, side)
         if mark
           putmarker!(m)
         end
  end
function followByCount(m::Robot, side::HorizonSide, number::Int)
            for k = 1:count
                  moveStep(m, side, false)
            end
end
m=Robot(animate=true)
main(m)
