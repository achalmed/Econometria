**Pregunta 2.

*a.

reg Y X2 X3

test (X2=0) (X3=0)
test (X2=0)
test X2+X3=0

clear all

*b. 

gen lnQ = ln(Q)
gen lnK = ln(K)
gen lnL = ln(L)


reg lnQ lnK lnL

*Probamos hipótesis de rend. constantes

test lnK + lnL = 1

*Modelo translog

gen lnK2 = lnK^2
gen lnL2 = lnL^2
gen lnKlnL = lnK*lnL

reg lnQ lnK lnL lnK2 lnL2 lnKlnL

test (lnK2 = 0) (lnL2 = 0) (lnKlnL = 0)

**Pregunta 3.

*a.

*Estimación irrestricta

reg lnQ lnK lnL

*Estimación restringida, forma 1: transformar el modelo

gen lnq = lnQ - lnL
gen lnk = lnK - lnL

reg lnq lnk

*Estimación restringida, forma 2: indicar que estime el modelo restringido

constraint 1 lnK + lnL = 1

cnsreg lnQ lnK lnL, constraints(1)
