*a)Regresionar:
reg lprice lnox dist rooms

*===========================*

*b)Despues regresionar:
reg lprice lnox dist rooms crime stratio
*-------------------------------------------------*
*hacer teste de significancia para crime y ratio:
di ((40.4778851-29.3645508)/2)/(29.3645508/500)
*94.615225

di invF(2,500,0.99)
*4.647847

di invF(2,500,0.95)
*3.013753

di invF(2,500,0.90)
*2.3132215

*se compará el primer término con los diferentes valores F-tabla.

*================================================================*

*c)hacer razón verosimilitud y test de multiplicadores de lagrange
*----------------------------------------------------------------*
*RV=n(ln(ê'ê)-ln(e'e))
di 506*(ln(40.4778851)-ln(29.3645508))
*162.4096

di invchi2(2,0.90)
*4.6051702

di invchi2(2,0.95)
*5.9914645

di invchi2(2,0.99)
*9.2103404
*---------------------------------------------------------------*
*Wald=(ê'ê-e'e)/(e'e/n)
di (40.4778851-29.3645508)/(29.3645508/506)
*191.50121

di invchi2(2,0.90)
*4.6051702

di invchi2(2,0.95)
*5.9914645

di invchi2(2,0.99)
*9.2103404
*----------------------------------------------------------------*
*ML=(ê´ê-e'e)/(ê'ê/n)
di (40.4778851-29.3645508)/(40.4778851/506)
*138.92394

di invchi2(2,0.90)
*4.6051702

di invchi2(2,0.95)
*5.9914645

di invchi2(2,0.99)
*9.2103404

*===================================================================*

*d)ver si hay multicolinealidad
vif

*====================================================================*

*e)hacer test white de la parte a)

 *1°. Regresionar y=XB+u, y luego generar e y e^2
 reg lprice lnox dist rooms
 predict residuo, resid
 gen residsq = resid*resid
 *2°. Regresionar e^2 con las X´s, sus cuadrados y sus producto cruzados
 
 gen lnoxsq = lnox*lnox
 gen distsq = dist*dist
 gen roomssq = rooms*rooms
 gen lnoxdist = lnox*dist
 gen lnoxrooms = lnox*rooms
 gen distrooms = dist*rooms
 
 reg residsq  lnox dist rooms lnoxsq distsq roomssq lnoxdist lnoxrooms distrooms
 
 *3°. Usar n*R^2 aux y debe distribuirse como una chi^2
 di 506*0.2471
 *125.0326
 
 di invchi2(10,0.90)
 *15.987179

 di invchi2(10,0.95)
 *18.307038

 di invchi2(10,0.99)
 *23.209251
*=======================================================================================================================================*

*f) Test breusch pagan
 *1°. Regresionar y=XB+u, y luego generar e  e^2 y ô^2=e'e/n
 reg lprice lnox dist rooms
 predict residuo, resid
 gen residsq = resid*resid
 gen sigest = residsq/(40.4778851/506)
 *2°. Se regresiona ô^2=e'e/n respecto a los W
 gen ilnox = 1/lnox
 gen idist = 1/dist
 gen irooms = 1/rooms
 gen lnoxsq = lnox*lnox
 gen distsq = dist*dist
 gen roomssq = rooms*rooms
 
 reg sigest lnox dist rooms lnoxsq distsq roomssq ilnox idist irooms
 *3°. Se compara SCE/2 con la chi^2
 di  1057.57134/2
 *528.78567
 
 di invchi2(9,0.90)
 *14.683657

 di invchi2(9,0.95)
 *16.918978

 di invchi2(9,0.99)
 *21.665994


 
