ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function main(m)	
	
	path = goToTheCornerRec(m, Sud, West)
	width, height, _1, _2 = measureBoard(m)
	
	side = Nord
	
	move!(r, Ost)
	d = 1
	o = 0
	
	while width > 0
	k += 1
	width -= 1
	c = height
	while c > 0
	if isborder(m, side)
	count, b = moveAround(m, side)
	c -= 1
	if k == 1
	o+= 1
	end
	else
	move!(m, side)
	c -= 1
	end
	end
	goToTheCornerRec(m, Sud, West)
	if width != 0
	moveByCr(m, Ost, d)
	end
	end
	
	goToTheCornerRec(m, Sud, West)
	
	for item in path[end:-1:1]
	followByCountRec(m, item[1], item[2])
	end
	print("Число перегородок: ", o, "\n")
	end
	
	function moveAround(m, side)
	horisont = 0
	vert = 0
	
	sides = Dict(
	Nord=>West,
	Sud=>West,
	Ost=>Sud,
	West=>Sud
	)
	
	while isborder(m, side)
	move!(m, sides[side])
	vertical += 1
	end
	move!(m, side)
	
	while isborder(m, inverseSide(sides[side]))
	move!(m, side)
	horisont += 1
	end
	move!(m, inverseSide(sides[side]))
	c = vert
	while c > 1
	move!(m, inverseSide(sides[side]))
	c -= 1
	end
	return (horisont, vert)
	end
	
	function moveByCoord(m, side, coord)
	while(cr > 0)
	coord -= 1
	move!(m, side)
	end
	end
	
	r=Robot(animate=true ,4, 4)
	main(m)
