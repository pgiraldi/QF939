function ufpair(rt, data :: Data)

	@unpack sig6, eps4, eps24 = data

	r6 = (rt[3])^3
	r4 = (rt[3])^2

	u = eps4*(sig6/r6 - 1.0)/r6

	f = eps24 * (r6 - 2*sig6) / (r6*r4*r4)

	fx = f * rt[1]
	fy = f * rt[2]

	return u, (-fx, -fy)
end
