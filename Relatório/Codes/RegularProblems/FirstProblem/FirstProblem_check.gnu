reset

set terminal wxt

set terminal epslatex color standalone
set output 'FirstProblem_check.tex'

set grid

set key box top right

set xrange[0:1]
# set yrange[0:1]

# set xlabel '$x$'
# set ylabel '$n_{5,6,7}$'

plot sin(pi*x)/(pi) w l dt 1 lt 1 lw 3 t '$y_1$' ,\
    sin(2*pi*x)/(2*pi) w l dt 2 lt 2 lw 3 t '$y_2$' ,\
    sin(3*pi*x)/(3*pi) w l dt 3 lt 3 lw 3 t '$y_3$' ,\
    sin(4*pi*x)/(4*pi) w l dt 4 lt 4 lw 3 t '$y_4$' ,\
    sin(5*pi*x)/(5*pi) w l dt 5 lt 5 lw 3 t '$y_5$'

set terminal wxt
replot