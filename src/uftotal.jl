function uftotal(p, data :: Data)

	@unpack N, cutoff, side, l, cutoff2 = data

	nt = Threads.nthreads()
	npt = div_thread(N, nt)

	U = zeros(nt)
	F = [ [0.0, 0.0] for i in 1:N ]

	first_atom, next_atom = initial_linklist(p, data)

	Threads.@threads for id in 1:nt

		@inbounds @simd for i in npt[id, 1]:npt[id, 2]

			icell = trunc(Int64, p[i][1]/cutoff) + 1
			jcell = trunc(Int64, p[i][2]/cutoff) + 1

			for ic in icell-1:icell+1, jc in jcell-1:jcell+1

				iw, jw = wrap_cell(ic, jc, l)

				j = first_atom[iw, jw]

				while j > 0

					if j > i

						r = rpbc_quad(p[i], p[j], side) # r = (rx, ry, r^2)

						if r[3] < cutoff2

							u, f = ufpair(r, data)

							F[i] .+= f
							F[j] .-= f

							U[id] += u
						end
					end

					j = next_atom[j]
				end
			end
		end
	end

	return sum(U), F
end
