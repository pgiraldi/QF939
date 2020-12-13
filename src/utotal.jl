function utotal(p, data :: Data)

	U = 0.0

	first_atom, next_atom = initial_linklist(p, data)

	for i in 1:data.N

		icell = trunc(Int64, p[i][1]/data.cutoff) + 1
		jcell = trunc(Int64, p[i][2]/data.cutoff) + 1

		for ic in icell-1:icell+1, jc in jcell-1:jcell+1

			iw, jw = wrap_cell(ic, jc, data)

			j = first_atom[iw, jw]

			while j > 0

				if j > i

					r = rpbc(p[i], p[j], data.side)

					if r < data.cutoff
						U += upair(r, data)
					end
				end

				j = next_atom[j]
			end
		end
	end

	return U
end
