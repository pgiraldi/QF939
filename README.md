# QF939

Pacote de simulação desenvolvido na disciplina QF939.

## Instalação

```julia
] add https://github.com/pgiraldi/QF939
```

## Utilização

Para melhor proveito da paralelização, iniciar o programa utilizando a opção `--threads ncpus`, onde *ncpus* é o número de núcleos que serão utilizados. Caso não especificado, apenas um núcleo é usado.

```sh
$ julia --threads 4
```

### Cálculo da energia

```julia
julia> using QF939

julia> data = Data();

julia> p = initial_point(data);

julia> utotal(p, data)
-7472.164849146468
```

### Cálculo da energia e forças

```julia
julia> using QF939

julia> data = Data();

julia> p = initial_point(data);

julia> u, f = uftotal(p, data);

julia> u
-7472.1648491465485

julia> f
10000-element Array{Array{Float64,1},1}:
 [2.9749744219446326, 1.730790463586403]
 [2.895569197423241, 0.4012591911584748]
 ⋮
 [-1.9097248442893169, 0.26542204723803553]
 [-3.1208157043186247, -2.0513425336203057]
```

## Propriedades implementadas

- [x] Distâncias mínimas
- [x] Células ligadas
- [x] Condições periódicas de contorno
- [x] Estrutura de dados
- [x] Listas ligadas
- [x] Paralelização
- [x] Cálculo da energia e das forças
- [ ] Velocidades iniciais
- [ ] Integração da equações de movimento

## Benchmark

Dentro da função `utotal` são feitas 4 alocações devido a inicialização dos arrays para gerar a lista ligada através da função `initial_linklist`, 2 alocações devido a distribuição de tarefas através da função `div_threads` e diversas outras relativas a paralelização. Na função `uftotal` é necessário criar um array zerado para armazenar as forças e por isso há um aumento significativo no número de alocações.

```julia
julia> using BenchmarkTools

julia> @btime utotal($p, $data)
  3.128 ms (27 allocations: 101.20 KiB)

julia> @btime uftotal($p, $data)
  3.829 ms (10029 allocations: 1.09 MiB)
```