ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true) 
function main(m::Robot)
    path = goCorner(Sud, West)
findBorder(m)
markBorder(m)

    goCorner(Sud, West)
             for item in path[end:-1:1]
                    print(item)
                    followCount(m, item[1], item[2])
             end
end
           function markBorder(m)
                 comp = Dict
             (   Nord => Ost,
                 West => Nord,
                 Sud => West,
                 Ost => Sud    )
             for side ∈ [Nord, West, Sud, Ost]
                   while isborder(m, side)
                      putmarker!(m)
                       move!(m, comp[side])
                   end
               putmarker!(m)
               move!(m, side)
              end
           end
     function findBorder(m)
            while(!isborder(m, Nord))
                if(!isborder(m, Ost))
                    move!(m, Ost)
                  else
                    moveSide(m, West)
                    move!(m, Nord)
                  end
                end
       
     end
function goToTheCorner(sideOne::HorizonSide, sideTwo::HorizonSide)
               pathBack = []
  while isborder(m, sideOne) != true || isborder(m, sideTwo) != true
          stepX = moveSide(m, sideOne)
             stepY = moveSide(m, sideTwo)
          push!(pathBack, [inverseSide(sideOne), stepX])
             push!(pathBack, [inverseSide(sideTwo), stepY])
 end

                return pathBack
end
          function moveSide(m::Robot, side::HorizonSide)
                  step = 0
                    while isborder(m, side) != true
                        move!(m, side)
                      step+= 1
                   end
                           return step
          end
    function followByCount(m::Robot, side::HorizonSide, number::Int)
                  for k = 1:number
                        moveStep(m, side, false)
                   end
end


m=Robot(animate=true)
main(m)
