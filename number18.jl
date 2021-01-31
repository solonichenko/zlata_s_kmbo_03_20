ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function main(m::Robot)	

	path = goToTheCornerRec(m, Sud, West)
	putmarker!(m)
	
	goToTheCornerRec(m, Nord, West)
	putmarker!(m)
	
	goToTheCornerRec(m, Nord, Ost)
	putmarker!(m)
	
	goToTheCornerRec(m, Sud, Ost)
	putmarker!(m)
	
	goToTheCornerRec(m, Sud, West)
	
	for item in path[end:-1:1]
	followByCountRec(m, item[1], item[2])
	end
	end
	
	m=Robot(animate=true)
	main(m)
