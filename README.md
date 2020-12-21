# QF939

Pacote de simulação desenvolvido na disciplina QF939.

## Instalação

```julia
] add https://github.com/pgiraldi/QF939
```

## Utilização

Para melhor proveito da paralelização, iniciar o programa utilizando a opção `--threads ncpus`, onde *ncpus* é o número de núcleos que serão utilizados. Caso não seja especificado apenas um núcleo é usado.

```sh
$ julia --threads 4
```

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

Dentro da função `utotal` são feitas 4 alocações devido a inicialização dos arrays para gerar a lista ligada através da função `initial_linklist`. Além disso, são feitas 2 alocação devido a distribuição de tarefas e diversas outras relativas a paralelização.

```julia
julia> using BenchmarkTools

julia> @btime utotal($p, $data)
  3.128 ms (27 allocations: 101.20 KiB)
```
