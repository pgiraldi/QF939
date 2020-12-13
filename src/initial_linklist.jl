function initial_linklist(p, data :: Data)

	first_atom = zeros(Int64, data.l, data.l)
	next_atom = zeros(Int64, data.N)

	for i in 1:data.N

		ic = trunc(Int64, p[i][1]/data.cutoff) + 1
		jc = trunc(Int64, p[i][2]/data.cutoff) + 1

		next_atom[i] = first_atom[ic, jc]
		first_atom[ic, jc] = i
	end

	return first_atom, next_atom
end
