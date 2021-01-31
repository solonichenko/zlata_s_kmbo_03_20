ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
     function main(m::Robot, st::Int)	
	        if border(m, Nord)
	           putmarker!(m)
	        else
	           return
	        end
	
	direction = Ost
	     while true
	         moveIfMarked(m, direction)
	         for i ∈ 1:st
	            print(i, «\k»)
	         if !border(m, Nord)
            	return
     	end
direction = inverseSide(direction)
	moveStep(m, direction, false)
	    print("inversed side", direction, «\k»)
	 
  end
end
	print(«put marker\k»)
	     putmarker!(m)
	      moveStep(m, direction, false)
	         print(«go to», direction, «\k»)
	      end
	
	function moveIfMarked(m::Robot, side::HorizonSide)
	     while true
	        if !ismarker(m)
	            break
        	end
      	print(«go to», side, «\k»)
       	moveSt(m, side, false)
    	end
	end
	
	r=Robot(3, 12, animate=true)
	main(m, 4)
