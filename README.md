# QF939

Pacote de simulação desenvolvido na disciplina QF939.

## Instalação:

```julia
] add https://github.com/pgiraldi/QF939
```

## Utilização

```julia
julia> using QF939

julia> data = Data();

julia> p = initial_point(data);

julia> utotal(p, data)
-7472.164849146468
```

## Propriedades implementadas

- [x] Distâncias mínimas
- [x] Células ligadas
- [x] Condições periódicas de contorno
- [x] Estrutura de dados
- [x] Listas ligadas
- [x] Paralelização

## Benchmark

Boa parte da alocação de memória é proveniente da paralelização, porém dentro da função `utotal` são feitas 4 alocações devido a inicialização dos arrays para gerar a lista ligada.

```julia
julia> using BenchmarkTools

julia> @btime utotal($p, $data)
  3.986 ms (20138 allocations: 417.97 KiB)
```
