genr ly=log(y)
genr lx2=log(x2)
genr lx3=log(x3)
genr lx4=log(x4)
genr lys=(ly-@mean(ly))/@stdev(ly)
genr lx2s=(lx2-@mean(lx2))/@stdev(lx2)
genr lx3s=(lx3-@mean(lx3))/@stdev(lx3)
genr lx4s=(lx4-@mean(lx4))/@stdev(lx4)
ls lys lx2s lx3s lx4s

 