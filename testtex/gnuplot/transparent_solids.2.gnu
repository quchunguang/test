unset title
set label 1 "Kuen's Surface" at screen 0.6, 0.9
set label 1 font "frscript,25"
set style line 3  linetype -1 linewidth 0.5
set pm3d depthorder hidden3d 3
set style fill  transparent solid 0.65 border
set palette
set hidden3d

set ticslevel 0
unset xtics ; unset ytics ; unset ztics
unset border ; unset colorbox ; unset key
set lmargin at screen 0.1
set bmargin at screen 0.1
set rmargin at screen 0.9
set tmargin at screen 0.9

set parametric
set dummy u,v
set urange [-4.5:4.5]
set vrange [0.05:pi-0.05]
set isosamples 51,51
set view 122, 357, 1.35, 1.08

a = 1.0

x(u,v) = 2.*a*(cos(u)+u*sin(u))*sin(v) / (1+u**2.*(sin(v))**2)
y(u,v) = 2.*a*(sin(u)-u*cos(u))*sin(v) / (1+u**2.*(sin(v))**2)
z(u,v) = a*log(tan(v/2.))+2.*cos(v)/(1+u**2.*(sin(v))**2)

splot x(u,v), y(u,v), z(u,v) with pm3d

