reset

set terminal wxt

set terminal epslatex color standalone
set output 'FirstProblem.tex'

set grid

set key box top right

# set xrange[-0.02:1.02]
# set yrange[0:1]

# set xlabel '$x$'
# set ylabel '$n_{5,6,7}$'

plot 'saida_firstproblem_auto1.dat' u 1:2 w l dt 1 lt 1 lw 3 t '$y_1$' ,\
    'saida_firstproblem_auto2.dat' u 1:2 w l dt 2 lt 2 lw 3 t '$y_2$' ,\
    'saida_firstproblem_auto3.dat' u 1:2 w l dt 3 lt 3 lw 3 t '$y_3$' ,\
    'saida_firstproblem_auto4.dat' u 1:2 w l dt 4 lt 4 lw 3 t '$y_4$' ,\
    'saida_firstproblem_auto5.dat' u 1:2 w l dt 5 lt 5 lw 3 t '$y_5$'

set terminal wxt
replot