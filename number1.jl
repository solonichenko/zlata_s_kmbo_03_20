ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
sides = (Nord, Sud, Ost, West)
function inverse(side::HorizonSide)
return HorizonSide(mod(Int(side)+2, 4)) 
end
function followMarkers(m::Robot,side::HorizonSide)
  while ismarker(m)==true 
   move!(m,side) 
  end
end
         function putmarkers!(m::Robot,side::HorizonSide)
           while isborder(m,side)==false 
            move!(m,side)
            putmarker!(m)
           end
         end
function main(m::Robot)
  for side in sides
    putmarkers!(m,side)
    followMarkers(m,inverse(side))
  end
 putmarker!(m)
end
m=Robot(animate=true)
main(m)
