**BP
**el restricto es mejor que el restrico porque se rechaza la h0
**hay heterocedasticidad porque se rechaza la h0
**no existe multicolinealidad en las variables porque el vif en cada una es menor que 10
**test white
GEN W_BP=e(N)* resid2/e(rss)
VIF
display invchi2(3,0.95)
display invchi2(3,0.95)
display invchi2(9,0.95)
drop redid
drop verosimilitud
gen BP= 3341.61785/2
gen F= ((SEC_RES-SSR_IRRES)/2)/((SSR_IRRES/(506-6)))
gen LM= (506*( SEC_RES- SSR_IRRES))/ SEC_RES
gen SEC_RES= e(rss)
gen SSR_IRRES=e(rss)
gen W_BP=e(N)* resid2/e(rss)
gen cruzado1= lnox* rooms
gen cruzado2= lnox* dist
gen cruzado3= rooms* dist
gen dist2= dist* dist
gen lnox2= lnox* lnox
gen resid2=resid^2
gen rooms2= rooms* rooms
gen verosimilitud = 506*(ln(SEC_RES)-ln(SSR_IRRES))
gen verosimilitud = 506*(ln(SEC_RES/506)-ln(SSR_IRRES))
gen white =e(N)*e(r2)
predict redid, resid
predict resid, resid
reg
reg W_BP lnox dist rooms
reg lprice lnox dist rooms
reg lprice lnox dist rooms
reg lprice lnox dist rooms crime stratio
reg resid2 lnox dist rooms lnox2 dist2 rooms2 cruzado1 cruzado2 cruzado3
tab BP
tab F
tab LM
tab verolsimilitud
tab verosimilitud
tab verosimilitud
tab white
tb LM
use "C:\Users\73251340\Downloads\hprice2.dta", clear
vif
