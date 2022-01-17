*Ponen la dirección donde está el archivo
cd "C:\Users\46815709\Desktop"
use data.dta

*a) La tabla de frecuencias de Combustible y modelo de carros.

tab Combustible


tab ModeloFinal

*b) Generando la variable antig y antig2

gen antig = 2016 - Anio

tab antig

gen antig2 = antig^2

tab antig2

reg Precio antig antig2

*Puedes generar la siguiente variable para sacar el precio
* gen deltaprecio = antig*(Valor del estimador de antig) + antig2*(Valor del estimador de antig2])
* Ambos puedes sacarlo de la regresión que te piden hacer.

reg Precio antig antig2

*c) Para generar la variable caja
gen caja = 1 if Transmision == "Automático" 
replace caja = 0 if Transmision == "Mecánico"

*La estimación del modelo.

reg Precio antig antig2 caja

*Puedes usar esto para instalar el test de White
h whitetst

*Luego lo aplicas

whitetst

*También puedes usar este que se encuentra en STATA sin instalar nada

imtest, white

*Para hacerlo por pasos se hace lo siguiente
*Se hallan los residuos

predict resid, resid

gen resid2 = resid^2

*Se hallan las variables auxiliares

gen antigs= antig^2
gen antig2s= antig2^2
gen cajas = caja^2
gen antigxantig2 = antig *antig2
gen antigxcaja = antig*caja
gen antig2xcaja= antig2*caja

*Regresionar Residuos al cuadrado por las variables

reg resid2 antig antig2 caja antigs antig2s cajas antigxantig2 antigxcaja antig2xcaja

*Vemos que el valor se halla

di e(N)*e(r2)

*El Rcuadradoaux = 11.546673
*Podrás ver que siempre sale el mismo Valor del Chi cuadrado

di invchi2(3,0.95)

*Aquí podrás ver que el valor de la Chi cuadrado de tabla es 7.8147.
*es menor que el Chi2 que hallamos, por tanto se rechaza la hipótesis nula
*de homocedasticidad

*Para hacer el B-P

*Podemos usar este test

reg Precio antig antig2 caja

estat hettest, rhs

*También lo podemos hacer por pasos

*Primero hallamos W

gen w = resid2*e(N)/e(rss)

*e(N) es el valor de las observaciones "n"  e(rss) es la SCR

reg w antig antig2 caja

di 0.5*e(mss)

*El valor de B-P y de la aproximación son iguales a 2.52

di invchi2(2, 0.95)

*En este caso, por B-P no es mayor que el Chi2 de tabla, entonces 
*no se rechaza la hipótesis nula de homocedasticidad

*d) Para poder hacer la prueba F sobre los modelos

*Como ya generamos estas variables antigxcaja antigxcaja2

reg Precio antig antig2 caja antigxcaja antig2xcaja

di ((44766575.5-e(rss))*(e(N)-6))/(e(rss)*3)

*El valor de F es 0.91745875

di invF(3,17,0.95)

*El F de tabla es 3.1967768, por tanto no se rechaza la hipótesis nula de
*que los estimadores de antigxcaja y antig2xcaja sean cero.

*Los valores del Akaike y Shwartz
*Este valor es el Akaike AIC

di  ln(e(rss)/e(N))+(2*6/e(N))

*Este valor es el Schwartz BIC

di ln(e(rss)/e(N))+(6/e(N))*ln(e(N))

*El AIC del modelo irrestricto es 14.853157 y el BIC del modelo es 15.149373

reg Precio antig antig2 

*Los valores del Akaike y Shwartz del modelo restricto son
*Este valor es el Akaike AIC

di  ln(e(rss)/e(N))+(2*6/e(N))

*Este valor es el Schwartz BIC

di ln(e(rss)/e(N))+(6/e(N))*ln(e(N))

*El AIC del modelo irrestricto es 15.003217 y el BIC del modelo es 15.299433

*Los Criterios de Información de AIC y BIC son mayores en el modelo que en
*el modelo irrestrico. Esto quiere decir que el mejor modelo es el irrestricto.
*Algo que hemos comprobado con la prueba F.
