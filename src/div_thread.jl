function div_thread(N :: Int64, nt :: Int64)

	npt = zeros(Int64, nt, 2)

	n = div(N, nt)

	for i in 1:nt
		npt[i, 1] = (i-1)*n + 1
		npt[i, 2] = npt[i, 1]-1+n
	end

	npt[nt, 2] += mod(N, nt)

	return npt
end
