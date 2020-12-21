function upair(r, data :: Data)

	@unpack sig6, eps4 = data

	r6 = (r^2)^3
	
	return eps4*(sig6/r6 - 1.0)/r6
end
