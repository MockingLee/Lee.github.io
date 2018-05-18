import numpy

ddcs = 5000

omiga = 0.1

dimension = 6
a = numpy.zeros((dimension, dimension), dtype=numpy.float64)
for i in range(0, dimension):
    for j in range(0, dimension):
        a[i][j] = 1 / (i + 1 + j + 1 - 1)

youbian = numpy.zeros((1, dimension), dtype=numpy.float64)

youbian = numpy.sum(a, 1)

zg = numpy.column_stack((a, youbian))

x = numpy.zeros((1, dimension), dtype=numpy.float64)
x_current = x.copy()

dd = 0
for t in range(0, ddcs):
    for i in range(0, dimension):
        dd = youbian[i]
        for j in range(0, dimension):
            dd -= a[i][j] * x_current[0][j]
        x[0][i] = dd / a[i][i] * omiga + x_current[0][i]
    x_current = x.copy()

print(x)
