import Random

pertubation(step, sig) = -sig + 2*sig*rand()

function initial_point(N, side, tol; seed=123)

	if seed > 0
		Random.seed!(seed)
	else
		Random.seed!()
	end

	p = [ zeros(2) for i in 1:N ]

	l = ceil(Int, sqrt(N))
	step = (side - tol)/l
	
	if tol > step
		error("tol must be smaller than $step")
	end

	skip = Int[]

	while length(skip) < (l^2-N)

		i = rand(1:l^2)

		if findfirst(isequal(i), skip) == nothing
			push!(skip, i)
		end
	end

	sig = (step - tol)/2

	ip = 0
	igrid = 0
	x = [ tol/2, tol/2 ]

	for i in 1:l
		for j in 1:l

			igrid += 1

			if findfirst() != nothing
				continue
			end

			ip += 1
			p[ip] .= x .+ pertubation(step, sig)
			x[2] += step
		end

		x[2] = tol/2
		x[1] += step
	end

	return p
end

initial_point(data :: Data; tol=0.9, seed=123) = initial_point(data.N, data.side, seed=seed)
