reset

set terminal wxt

set terminal epslatex color standalone
set output 'CordaProblem.tex'

set grid

# set key box top left
unset key

set xrange[-1:1]
# set yrange[0:1]

# set xlabel '$x$'
# set ylabel '$n_{5,6,7}$'

plot 'saida_cordaproblem_auto1.dat' u 2:1 w l dt 1 lt 1 lw 4 notitle ,\
    'saida_cordaproblem_auto2.dat' u 2:1 w l dt 1 lt 2 lw 4 notitle ,\
    'saida_cordaproblem_auto3.dat' u 2:1 w l dt 2 lt 3 lw 4 notitle ,\
    'saida_cordaproblem_auto4.dat' u 2:1 w l dt 2 lt 4 lw 4 notitle ,\
    'saida_cordaproblem_auto5.dat' u 2:1 w l dt 2 lt 5 lw 4 notitle

set terminal wxt
replot