ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
     function main(m::Robot)	

	     westside = goSide(m, West)
	     nordside = goSide(m, Sud)
	
	count = goSide(m, Ost)
	goToTheSide(m, West)
	
	path = [[Ost, westside], [Nord, nordside]]
	
	
	markRow(m, Ost, count)
	count -= 1
	while !isborder(m, Nord)
	      move!(m,Nord)
	     goSide(m, West)
	      markRow(m, Ost, count)
	      count -= 1
	end
	
	goSide(m, West)
	goSide(m, Sud)
	
	for item in path[end:-1:1]
	followCount(m, item[1], item[2])
	end
	end
	
	function markRow(m::Robot,side::HorizonSide, count)
	bias = 0
	print("Маркирую строку\n")
	putmarker!(m)
	while !border(m, side)
	     move!(m, side)
	        if bias < count
           putmarker!(m)
	         bias += 1
	        end
	end
	while moveIfPossible(m,side) == true
	   if bias < count
	     putmarker!(m)
	     bias += 1
	   end
	end
	    print("Готово\n")
	    end
	
	m=Robot(5, 5, animate=true)
	main(m)
