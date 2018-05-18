import numpy

ddcs = 10

dimension = 6
a = numpy.zeros((dimension, dimension), dtype=float)
for i in range(0, dimension):
    for j in range(0, dimension):
        a[i][j] = 1 / (i + 1 + j + 1 - 1)

youbian = numpy.zeros((1, dimension), dtype=float)

youbian = numpy.sum(a, 1)

zg = numpy.column_stack((a, youbian))

x = numpy.zeros((1, dimension), dtype=float)
x_current = x.copy()

dd = 0
for t in range(0, ddcs):
    for i in range(0, dimension ):
        dd = youbian[i]
        for j in range(0, dimension):
            if j != i:
                dd -= a[i][j] * x_current[0][j]
        x[0][i] = dd / a[i][i]
    x_current = x.copy()

print(x)
