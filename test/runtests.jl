using QF939
using Test

@testset "Distance function" begin

	x = [0, 0];
	y = [12, 12];
	side = 10;

	@test isapprox(QF939.rpbc(x, y, side), sqrt(8));

	y = [17, 17];

	@test isapprox(QF939.rpbc(x, y, side), sqrt(18));
end

@testset "Potential Energy" begin

	data = Data();

	@test isapprox(QF939.upair(π, data), -0.0003250451775148634);

	p = initial_point(data);

	@test isapprox(utotal(p, data), -7472.164849146468);
end

@testset "Potential Energy and Forces" begin

	data = Data();
	p = initial_point(data);

	u, f = uftotal(p, data);

	@test isapprox(u, -7472.164849146468);
	@test isapprox(f[1], [2.9749744219446326, 1.730790463586403]);
	@test isapprox(f[data.N], [-3.1208157043186247, -2.0513425336203057]);
end
