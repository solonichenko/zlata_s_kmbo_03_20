ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function main(m::Robot)
putmarker!(m)

gotoSide_checkmarked(m, Nord)
gotoSide_checkmarked(m, West)

direction = Ost
   while border(m, Sud) != true || border(m, Ost) != true
gotoSide_checkmarked(m, direction)
marked = false
                         if marker(m)
                              marked = true
                         end
       if border(m, Sud) != true
               moveStep(m, Sud, !marked, true)
       end
direction = inverseSide(direction)
    end
end

function gotoSide_checkmarked(m::Robot, side::HorizonSide)
          marked = false
   while border(m, side) != true
      if marker(m)
         marked = true
      end

             moveStep(m, side, !marked, true)
             marked = false
    
    end 
end

m=Robot(animate=true)
main(m)
