function wrap_cell(l, ic, jc)

	wrap = [ic, jc]

	for i in 1:2
		if wrap[i] <  1
			wrap[i] = l
		elseif wrap[i] > l
			wrap[i] = 1
		end
	end

	return wrap[1], wrap[2]
end
