ENV["MPL BACKEND"]="TkAgg"
using PyPlot
using HorizonSideRobots
pygui(true)
include("robot's operation.jl")
function get_mean_temperature(m::Robot)	
	sumt, numm = get_sum_temperatures(m)
	return sumt/numm
	end
	
	function get_sumt(m::Robot)
	side=Ost
	sumt, numm = get_sumt(m,side)
	while border(m,Nord)==false
	     move!(r,Nord)
	          side=inverseSide(side)
	     parts, partn = get_sumt(m,side)
	     sumt+=part_sum
	    numm+=part_num
	end
	     return sumt, numm
	end
	
	while border(m,side)==false
	     move!(m,side)
	   if marker(m)==true
	       sumt += temperature(m)
	       num_markers += 1
   	 end
	end
	    return sumt, numm
	end
  function get_sumt(m::Robot,side::HorizonSide)
	       if marker(m)==false
	         sumt=0
	         numm=0
	       else
	          sumt=temperature(m)
	          num_markers=0
	end
	
	m=Robot(animate=true)
	mean = get_meant(m)
	print(mean)
