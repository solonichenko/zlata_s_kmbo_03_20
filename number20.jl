ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function main(m)	
	p = goToTheCornerRec(m, Sud, West)
	w, _1, h, _2 = measureBoard(r)
	obcount = horisontalSearch(m, w, h) + verticalSearch(m, w, h)
	            for item in p[end:-1:1]
	                   followByCountRec(m, item[1], item[2])
	            end
	print("перегородок: ", obcount, "\n")
end
	
  function moveByCoord(m, s, co)
	            while(co > 0)
	            co-= 1
	            move!(m, s)
	            end
	end
	
sides = Dict(
	Nord=>West,
	Sud=>West,
	Ost=>Sud,
	West=>Sud
	)
	function moveAround(m, s)
	horisont = 0
	vert = 0
	
	
	while isborder(m, s)
	                move!(m, sides[s])
	                vert += 1
	end
	      move!(m, s)
	    while isborder(m, inverseSide(sides[s]))
	      move!(m, s)
	      horisont += 1
	    end
	 while(a > 1)
	       move!(m, inverseSide(sides[s]))
	       ca-= 1
	 end
move!(m, inverseSide(sides[s]))
	     a = vert
	     return (horisont, vert)
	end
	function horisontalSearch(m, w, h)
	         side = Nord
	
	         move!(m, Ost)
	         d = 1
	         obs = 0
	   while w > 0
	       k += 1
	       w -= 1
	       f= h
	   while f> 0
	          if isborder(m, side)
	                 count, w= moveAround(m, side)
	                 f -= 1
	          if w == 1
	             obs += 1
	          end
	     else
	        move!(r, side)
	        f -= 1
	     end
	          end
	goToTheCornerRec(m, Sud, West)
	       if width != 0
	            moveByCoord(m, Ost, w)
	       end
	end
	
	goToTheCornerRec(m, Sud, West)
	       print("перегородок: ", obs, "\n")
	       return obs
	end
  function verticalSearch(m, w, h)
	       side = Ost
	       move!(m, Nord)
	       w = 1
	
	obstacles = 0
	      while height > 0
	            w+= 1
	            h -= 1
	            f= w
	      while f > 0
	 if isborder(m, side)
	          count, w = moveAround(m, side)
	          f = f- count - 1
	 if (w == 1) && (count*w == 0)
	       obs += 1
	 end
	      else
	move!(m, side)
	           f -= 1
	end
	end
	          goToTheCornerRec(m, Sud, West)
	if(h != 0)
	        moveByCoord(m, Nord, d)
	        end
	end
	goToTheCornerRec(m, Sud, West)
	          print("перегородок: ", obs, "\n")
	           return obs
	end
	
	m=Robot(animate=true,4, 4)
	main(m)
