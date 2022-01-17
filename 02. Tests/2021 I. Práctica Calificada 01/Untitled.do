keep a*o conglome vivienda hogar ubigeo pobreza

gen dep=real(substr(ubigeo,1,2))

*lab var dep "Departamento" // Nombre a la variable

lab def dep 1 "Amazonas" 2 "Ancash" 3 "Apurimac" /// 
4 "Arequipa" 5 "Ayacucho" 6 "Cajamarca" 7 "Callao" 8 "Cusco" ///
9 "Huancavelica" 10 "Huanuco" 11 "Ica" 12 "Junin" ///
13 "Libertad" 14 "Lambayeque" 15 "Lima" 16 "Loreto" ///
17 "Madre de Dios" 18 "Moquegua" 19 "Pasco" 20 "Piura" ///
21 "Puno" 22 "San Martin" 23 "Tacna" 24 "Tumbes" 25"Ucayali"

tab pobreza if dep==25, miss // Dep de Ayacucho