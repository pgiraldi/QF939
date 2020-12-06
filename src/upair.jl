function upair(r, data)

	r6 = (r^2)^3
	
	return data.eps4*(data.sig6/r6 - 1.0)/r6
end
