function utotal(p, data)

	U = 0.0

	for i in 1:data.N-1, j in i+1:data.N

		r = rpbc(p[i], p[j], data.side)

		if r < data.cutoff
			U += upair(r, data)
		end
	end

	return U
end
