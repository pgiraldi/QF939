using Parameters

@with_kw struct Data

	N :: Int64 = 10000

	eps :: Float64 = 5.0
	sig :: Float64 = 0.5

	cutoff :: Float64 = 2.0
	side :: Float64 = 100.0

	l :: Int64 = trunc(Int64, side/cutoff)

	cutoff2 :: Float64 = cutoff^2
	sig6 :: Float64 = (sig^2)^3
	eps4 :: Float64 = 4*eps*sig6
	eps24 :: Float64 = 6*eps4
end
