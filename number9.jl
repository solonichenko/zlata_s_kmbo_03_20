ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function main(r::Robot)	
	x = Sud
	y = Ost
	count = 1
	
	while true #!marker(m)
     	for i ∈ 1:count
      	if marker(m)
        	return
      	end
    	moveStep(m, x, false)
	end
	
	for i ∈ 1:count
	    if marker(m)
	        return
	    end
	       moveStep(m, y, false)
	end
	    x = inverseSide(x)
    	y = inverseSide(y)
	count += 1
	   end
	end
	
	m=Robot(animate=true)
	main(m)
