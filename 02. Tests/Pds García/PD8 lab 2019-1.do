**Pregunta 2: Multicolinealidad

*c.

sysuse auto.dta
*se crea la variable a partir del comando gen
gen weightsq = weight^2
reg price weight weightsq trunk
vif
*el primero es la regresion de weight al cuadrado con las otras dos
/*el promedio de lo VIFes 40--> la varianza se esta inflando cuarenta veces */

reg price weight trunk
vif

**Pregunta 3: Dummies

*b.

clear all

h bcuse
bcuse wage1.dta

*i.
reg wage educ exper expersq tenure tenursq

*tenure --> permanencia en el trabajo
*no hay multicolinealidad perfecta
* sale que a mas años de educacion, el salario es mas alto
* y asi con todas

*ii.
gen male = 1 if female == 0  
replace male = 0 if female == 1
*female--> viene como dato
*estos dos coandos van juntos porque si solo corres la primera linea
*solo los hombres tienen el numero 1 y las mujeres tienen "." esto 
*porque los considera como missings, entonces, se debe correr la segunda
*linea


reg wage educ exper expersq tenure tenursq female male
*TE SALE OMITTED porque stata es inteligente y descarta la colinealidad

*iii.
reg wage educ exper expersq tenure tenursq female
/* vemos que las mujeres ganan -1.78 dolares por hora menos que los hombres. 
Esta variable es significativa al 99% */


*iv.
reg wage educ exper expersq tenure tenursq female nonwhite

/* esto dice que no hay brechas de etnicidad, pero es probable que esto
este sesgadp*/
