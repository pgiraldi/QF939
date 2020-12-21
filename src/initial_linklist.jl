function initial_linklist(p, data :: Data)

	@unpack N, cutoff, l = data

	first_atom = zeros(Int64, l, l)
	next_atom = zeros(Int64, N)

	for i in 1:N

		ic = trunc(Int64, p[i][1]/cutoff) + 1
		jc = trunc(Int64, p[i][2]/cutoff) + 1

		next_atom[i] = first_atom[ic, jc]
		first_atom[ic, jc] = i
	end

	return first_atom, next_atom
end
