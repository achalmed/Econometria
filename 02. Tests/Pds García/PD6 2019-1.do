*a. Abrir base y correr regresión
sysuse auto.dta

reg price weight length

*b. Añadir variables

reg price weight length mpg trunk

*c. Frisch-Waugh

*1ra etapa

reg price mpg trunk

predict e_y, residuals

*2da etapa

reg weight mpg trunk

predict e_1, residuals

reg length mpg trunk

predict e_2, residuals

*3ra etapa

reg e_y e_1 e_2

*Comparamos

reg price weight length mpg trunk
