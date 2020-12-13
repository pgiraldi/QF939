# QF939

Pacote de simulação desenvolvido na disciplina QF939 

## Instalação:

```julia
] add https://github.com/pgiraldi/QF939
```

## Utilização

```julia
julia> using QF939

julia> data = Data()

julia> p = initial_point(data)

julia> first_atom, next_atom = initial_linklist(p, data)

julia> utotal(p, first_atom, next_atom, data)
```
