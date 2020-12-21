function utotal(p, data :: Data)

	@unpack N, cutoff, side, l = data

	nt = Threads.nthreads()

	U = zeros(nt)

	npt = div_thread(N, nt)
	first_atom, next_atom = initial_linklist(p, data)

	Threads.@threads for id in 1:nt

		@inbounds for i in npt[id, 1]:npt[id, 2]

			icell = trunc(Int64, p[i][1]/cutoff) + 1
			jcell = trunc(Int64, p[i][2]/cutoff) + 1

			for ic in icell-1:icell+1, jc in jcell-1:jcell+1

				iw, jw = wrap_cell(ic, jc, l)

				j = first_atom[iw, jw]

				while j > 0

					if j > i

						r = rpbc(p[i], p[j], side)

						if r < cutoff
							U[id] += upair(r, data)
						end
					end

					j = next_atom[j]
				end
			end
		end
	end

	return sum(U)
end
