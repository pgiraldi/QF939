# QF939

Pacote de simulação desenvolvido na disciplina QF939.

## Instalação

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
- [ ] Paralelização

## Benchmark

Dentro da função `utotal` são feitas 4 alocações devido a inicialização dos arrays para gerar a lista ligada.

```julia
julia> using BenchmarkTools

julia> @btime utotal($p, $data)
  5.612 ms (4 allocations: 97.84 KiB)
```
