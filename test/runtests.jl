using QF939
using Test

@testset "Distance function" begin

	x = [0, 0]
	y = [12, 12]
	side = 10

	@test isapprox(QF939.rpbc(x, y, side), sqrt(8))

	y = [17, 17]

	@test isapprox(QF939.rpbc(x, y, side), sqrt(18))
end

@testset "Potential Energy" begin

	data = Data()

	@test QF939.upair(π, data) ≈ -0.0003250451775148634

	p = initial_point(data.N, data.side, 0.9)

	@test utotal(p, data) ≈ -7472.164849146468
end
