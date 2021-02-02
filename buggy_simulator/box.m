function ret = box(x,y,dx,dy,color)

	xdata=[x x+dx x+dx x]
	ydata=[y y y+dy y+dy]
	fill(xdata,ydata,color)
end
