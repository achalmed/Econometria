use "C:\Users\73251340\Downloads\data.dta"
tab combustible
tab Combustible
tab Marca
tab ModeloFinal
gen antig=2016- Anio
gen antig2=antig^2
reg Precio antig antig2
gen caja=0
replace caja=1 if Transmision=="Automático"
br
reg Precio Transmision
reg Precio antig antig2
reg Precio antig antig2 caja
predict e,resid
gen e2= e^2
gen antig2= antig^2
gen antig22= antig^2
gen caja=caja^2
gen caja2^
gen caja2=caja^2
gen caja_antig=caja*antig
gen antig_antig2=antig*antig2
gen caja_antig2=caja*antig2
drop antig22
gen antig22=antig2^2
drop caja2 antig22 caja_antig2 antig_antig2 caja_antig caja2
gen cruzado1= antig* antig2
gen cruzado2= antig* caja
gen cruzado3= antig2* caja
gen antigs= antig* antig
gen antig2s= antig2* antig2
gen cajas= caja* caja
reg e2 antig antig2 caja cruzado1 cruzado2 cruzado3 antigs antig2s cajas
gen w= e(r2)*e(N)
tab w
display invchi2(9,0.95)
display invchi2(7,0.95)
**BP
gen BPM= e2*e(N)/e(rss)
reg br BPM
br BPM
tab BPM
reg BPM antig antig2 caja
gen sseaux= 9.5769e-12/2
tab sseaux
display invchi2(3,0.95)
br
predict e,resid
gen e2= e^2
tdt DW
tst dw
reg Precio antig antig2
gen erest=e(rss)
reg Precio antig antig2 caja cruzado2 cruzado3
gen eirrest=e(rss)
gen F = ((erest-eirrest)/3)/((eirrest)/(23-6))
tab F
gen akaike = ln(38528619.3/23)+ln((2*6)/23)
tab akaike
gen shwartz =ln(38528619.3/23)+6/23*ln(23)
tab shwartz
estat ic
