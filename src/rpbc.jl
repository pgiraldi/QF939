function rpbc(p1, p2, side)

	rx = (p1[1] - p2[1]) % side
	rt = (p1[2] - p2[2]) % side

	if rx > side/2
		rx -= side
	elseif rx < -side/2
		rx += side
	end

	if ry > side/2
		ry -= side
	elseif ry < -side/2
		ry += side
	end

	return sqrt(rx^2 + ry^2)
end
