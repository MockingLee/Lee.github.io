import matplotlib.pyplot as plt
import numpy as np
import math

x = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
y = [9.01,8.96,7.96,7.96,8.02,9.05,10.13,11.18,12.26,13.28,13.32,12.61,11.29,10.22,9.15,7.95,7.95,8.86,9.81,10.80,10.93]

plt.plot(x,y)
plt.show

length = 0

for i in range(0,19):
    length += math.sqrt(1 + math.pow((y[i+1] - y[i]),2))

print(length)

