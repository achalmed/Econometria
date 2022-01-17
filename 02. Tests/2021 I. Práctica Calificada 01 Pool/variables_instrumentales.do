********************************************************************************
*							ECONOMIA CON MANZANITAS			
********************************************************************************

*:::::::::::::::::::::TEMA: Variables Instrumentales::::::::::::::::::::::::::::

Para un mejor aprendisaje, revisar el Sgt Enlace :D

https://www.youtube.com/watch?v=FCypkFPFRZM

clear all
set more off

*Datos del valor de las viviendas y la renta mensual por estados
use http://www.stata-press.com/data/r15/hsng, clear

*queremos modelar la renta en funcion del valor de la vivienda y el % de probacion

//********************Regresion MCO
*variable dependiente: renta o alquiler promedio
*variable independiente: valor de la vivienda y % de la problacion

describe  rent hsngval pcturban
summarize rent hsngval pcturban

regress rent hsngval pcturban
estimates store con_endo
matrix A=e(b)
matrix a=e(V)


//*******************Regesion IV-2 Etapas

*los facotes que afectan a la renta promedio tambien afectan al valor de la vivienda

*variable endogena: valor promedio de la vivienda
*Instrumento: ingresos familiar del propietario,regiones
ivregress 2sls rent pcturban (hsngval = faminc i.region), first
estimates store sin_endo
matrix B=e(b)
matrix b=e(V)

//***********Detalle de los Minimos cuadrados en 2 etapas

regress hsngval faminc i.region pcturban  //estimamos la regresion auxiliar 
predict hsngvalhat, xb //proyectamos nuestra variable endogena
regress rent hsngvalhat pcturban //incluimos nuestra varaible endogena en el modelo
matrix C=e(b)

//*************Test de Hausman para regresores endogenos
*este es un test Ex-Post Estimacion, conocemos del problema despues de solucionarlo
hausman  sin_endo con_endo

matrix list B
matrix list C
matrix dc=B-A
matrix dv=b-a
matrix idv=invsym(dv)

matrix H=dc*idv*dc'
matrix list H

*+++++++++++No te olvides de comentar y suscribirte al canal+++++
