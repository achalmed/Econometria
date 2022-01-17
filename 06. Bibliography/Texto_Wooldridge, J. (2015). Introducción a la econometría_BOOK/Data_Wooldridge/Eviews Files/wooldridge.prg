!i = 0

for %a 401k 401ksubs admnrev affairs airfare apple athlet1 athlet2 attend audit barium bwght2 bwght campus card cement ceosal1 ceosal2 consump corn cps78_85 cps91 crime1 crime2 crime3 crime4 discrim earns engin ezanders ezunem fair fertil1 fertil2 fertil3 fish fringe gpa1 gpa2 gpa3 hprice1 hprice2 hprice3 hseinv htv infmrt injury intdef intqrt inven jtrain2 jtrain kielmc lawsch85 loanapp lowbrth mathpnl meap93 mlb1 mroz murder nbasal nyse openness pension phillips pntsprd prison prminwge rdchem rdtelec recid rental return saving sleep75 slp75_81 smoke traffic1 traffic2 twoyear volat vote1 vote2 wage1 wage2 wagepan wageprc wine


ctest read DSFMT_STATA "c:\documents and settings\glenn\desktop\new folder (3)\{%a}.dta" "<data table>" "" "*" "" "" "" ""
save %a
close %a
!i = !i + 1
next

statusline "converted !i"

