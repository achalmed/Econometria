**Pregunta 1: Dummies interactivas

ssc install bcuse
bcuse wage1.dta, clear

gen educ_female = educ*female

reg wage educ exper expersq tenure tenursq female educ_female

