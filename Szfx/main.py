import numpy

dimension = 6

a = numpy.zeros((dimension, dimension), dtype=float)
for i in range(0, dimension):
    for j in range(0, dimension):
        a[i][j] = 1 / (i + 1 + j + 1  - 1)



youbian = numpy.zeros((1, dimension), dtype=float)

youbian = numpy.sum(a,1)

zg = numpy.column_stack((a,youbian))


for i in range(0,dimension-1):
    line = i
    for i in range(i,dimension -1):
        for j in range(0, dimension + 1):
            zg[i + 1][j] += (-zg[line][i + 1] / zg[line][line]) * zg[line][j]

x = numpy.zeros((1,dimension))

dsyb = 0



for i in range(0,dimension):
    current = dimension - 1 - i
    dsyb = zg[current][6]
    for j in range(0,dimension):
        if j != current:
            dsyb -= zg[current][j]
    x[0][current] = dsyb/zg[current][current]

print(x)











