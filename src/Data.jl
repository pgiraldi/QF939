using Parameters

@with_kw struct Data

	eps :: Float64 = 5.0
	sig :: Float64 = 0.5

	cutoff :: Float64 = 2.0
	side :: Float64 = 100.0

	N :: Int64 = 10000

	sig6 :: Float64 = (sig^2)^3
	eps4 :: Float64 = 4*eps*sig6
end
