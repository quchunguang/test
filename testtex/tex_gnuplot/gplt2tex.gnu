set term latex
set size 1,1
set out 'gplt.tex'
set xlabel '$\theta$'
set ylabel '$sin(\theta)$'
plot sin(x) notitle
