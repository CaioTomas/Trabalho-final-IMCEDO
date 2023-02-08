reset

set terminal wxt

set terminal epslatex color standalone
set output 'SecondProblem.tex'

set grid

# set key box top left
unset key

# set xrange[-0.02:1.02]
# set yrange[0:1]

# set xlabel '$x$'
# set ylabel '$n_{5,6,7}$'

plot 'saida_secondproblem_auto1.dat' u 1:2 w l dt 1 lt 1 lw 4 notitle ,\
    'saida_secondproblem_auto2.dat' u 1:2 w l dt 1 lt 2 lw 4 notitle ,\
    'saida_secondproblem_auto3.dat' u 1:2 w l dt 2 lt 3 lw 4 notitle ,\
    'saida_secondproblem_auto4.dat' u 1:2 w l dt 2 lt 4 lw 4 notitle ,\
    'saida_secondproblem_auto5.dat' u 1:2 w l dt 2 lt 5 lw 4 notitle

set terminal wxt
replot