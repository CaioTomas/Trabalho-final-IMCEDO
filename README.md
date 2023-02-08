# Trabalho final da disciplina de Introdução a Métodos Computacionais em EDOs

Este repositório contém os arquivos dos relatórios e dos códigos e gráficos produzidos para o trabalho final do curso de Introdução a Métodos Computacionais em Equações Diferenciais Ordinárias (IMCEDO) do Programa de Pós-Graduação em Matemática (PPGMAT), ministrado pelo prof. Dr. Yuri Dumaresq Sobral no segundo semestre letivo de 2022 da Universidade de Brasília.


O objetivo do trabalho foi resolver, numericamente, problemas de Sturm-Liouville, lançando mão do método do tiro. Dois problemas regulares e dois problemas singulares são resolvidos e a robustez do método é testada. Um dos problemas singulares trata de uma aplicação do método para resolver o problema de uma corda pendurada, investigado pela primeira vez por Daniel Bernoulli em 1732.

## Estrutura dos códigos
Para resolver o PVC pelo método do tiro, utilizamos 3 arquivos:
- ``constants.f90``: contém a declaração das constantes e das variáveis do programa
- ``IVP_solver_RK4.f90``: contém a subrotina ``IVP_solver_RK``, que resolve a EDO pelo método clássico de Runge-Kutta de 4ª ordem, e a função ``f``, que é a função que define a EDO ( $\mathbf{y}'= \mathbf{f}(t, \mathbf{y})$ )
- ``main.f90``: arquivo principal, que implementa o método da bisseção para atualização da estimativa para o autovalor.
