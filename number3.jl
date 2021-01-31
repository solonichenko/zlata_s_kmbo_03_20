ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
function inverseSide(side::HorizonSide)
return HorizonSide(mod(Int(side)+2, 4))
end

    function main(m::Robot)
             stepWest = moveSide(m, West)
             stepNord = moveSide(m, Nord)
        while !ismarker(m)
                moveSide(m, Sud, true, true)
             if isborder(m, Ost) != true
                 moveStep(m, Ost, true)
             end
                        moveSide(m, Nord, true, true)
                     if isborder(m, Ost) != true
                        moveStep(m, Ost, true)
                     end
        end
moveSide(m, West)
moveSide(m, Nord)
followoNumber(m, Ost, stepWest)
followNumber(m, Sud, stepNord)
    end
           function moveStep(m::Robot, side::HorizonSide, mark::Bool)
                    if mark
                       putmarker!(m)
                    end
               move!(m, side)
           end

   function moveSide(m::Robot, side::HorizonSide, mark=false, check=false)
            step = 0
                while isborder(m, side) != true
                      moveStep(m, side, mark)
                  if check
                  if ismarker(m)
                         return
                  end
                  end
                      step += 1
                 end
           return step
   end
function followByCount(m::Robot, side::HorizonSide, number::Int)
  for k = 0:number-1
     moveStep(m, side, false)
  end
end
m=Robot(animate=true)
main(m)
