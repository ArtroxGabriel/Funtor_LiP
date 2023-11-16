# Avaliação pratica 3 de LiP

## Objetivos:
### <<<<<< 1º >>>>>>
Implemente, no modelo declarativo concorrente de Oz, um funtor (componente) que ofereça portas lógicas para construção de circuitos digitais, baseado no conteúdo da Seção 4.3.5 do livro-texto;

### <<<<<< 2º >>>>>>
Utilize o funtor para criar pelo menos três circuitos lógicos minimamente complexos à sua escolha, implementados pela composição das portas lógicas básicas, com exceção dos circuitos mostrados na Seção 4.3.5 como exemplos. Esses circuitos, assim com as portas lógicas, também deve estar encapsulado em um funtor, de modo que possam ser reusados em alguma aplicação de simulação de lógica digital.

### <<<<<< 3º >>>>>>
Escreva um programa principal para demonstrar o uso dos circuitos e portas lógicas dos dois funtores no ambiente Mozart.

## Executando programa:
Para executar o programa, basta executar o comando abaixo no terminal:
```bash
$ ozc -c portaslogicas.oz 
$ ozc -c pratica3.oz
$ ozc -c main.oz -o main.ozf
$ ozengine main.ozf
```
> Ou execute o comando `make && make run`
<center>

| Nome | 
|:-:|
| Jonanthan Aires |
| Antonio Gabriel |

</center>