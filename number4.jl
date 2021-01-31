ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
function inverseSide(side::HorizonSide)
return HorizonSide(mod(Int(side)+2, 4))
end

function main(m::Robot)
    stepsToWest = moveSide(m, West)
    stepsToNord = moveSide(m, Sud)
    counter = moveSide(m, Ost)
    moveSide(m, West)
   while true
        putmarker!(m)
        moveSideByCount(m, Ost, number)
        moveSide(m, West)
              if isborder(m, Nord) == true
                  break
              end

        moveStep(m, Nord, false)
        number -= 1
   end
    moveSide(m, West)
    moveSide(m, Sud)
    followByCount(m, Ost, stepWest)
    followByCount(m, Nord, stepNord)
end
     function followByCount(m::Robot, side::HorizonSide, numb::Int)
          for k = 0:numb-1
               moveStep(m, side, false)
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

     function moveSideByCount(m::Robot, side::HorizonSide, numb)
           for k in 1:numb
                if isborder(m, side) != true
                    moveStep(m, side, true)
                        else
                           break
                        end
               end
     end
                  function moveStep(m::Robot, side::HorizonSide, mark::Bool)
                              move!(m, side)
                        if needMark
                           putmarker!(m)
                        end
                  end
m=Robot(animate=true)
main(m)
