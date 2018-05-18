import numpy


def gauss():
    dimension = 6

    a = numpy.zeros((dimension, dimension), dtype=float)
    for i in range(0, dimension):
        for j in range(0, dimension):
            a[i][j] = 1 / (i + 1 + j + 1 - 1)

    youbian = numpy.zeros((1, dimension), dtype=float)

    youbian = numpy.sum(a, 1)

   # matrix1 = [[0.0003, 3.0000], [1.0000, 1.0000]]
   #matrix2 = [2.0001, 1.0000]

    matrix1 = a
    matrix2 = youbian
    result = [0, 0]
    k = 0
    p = k
    big = matrix1[k][k]
    for i in range(k+1, 1):
        dummy = matrix1[i][k]
        if dummy > big :
            big = dummy
            p = i

    if p != k :
        for j in range(k, 1):
            dummy = matrix1[p][j]
            matrix1[p][j] = matrix1[k][j]
            matrix1[k][j] = dummy
        dummy = matrix2[p]
        matrix2[p] = matrix2[k]
        matrix2[k] = dummy

    for w in range(0, 0):
        for i in range(w+1, 1):
            factor = matrix1[i][w]/matrix1[w][w]
            for j in range(w+1, 1):
                matrix1[i][j] = matrix1[i][j] - factor * matrix1[w][j]
            matrix2[i] = matrix2[i] - factor * matrix2[w]

    for w in range(0, 1):
        result[w] = matrix2[w] / matrix1[w][w]

    for i in range(0, 0):
        sum = matrix2[i]
        for j in range(i+1, 1):
            sum = sum - matrix1[i][j] * result[j]
        result[i] = sum / (matrix1[i][j] * 10000)

    return result

print(gauss())