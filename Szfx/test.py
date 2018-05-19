import matplotlib.pyplot as plt
import numpy as np
#潘海东,2014/1/13

x = np.arange(0, 21, 1)
y = np.array([9.01,8.96,7.96,7.96,8.02,9.05,10.13,11.18,12.26,13.28,13.32,12.61,11.29,10.22,9.15,7.95,7.95,8.86,9.81,10.80,10.93])
z1 = np.polyfit(x, y, 6)#用3次多项式拟合
p1 = np.poly1d(z1)
print(p1) #在屏幕上打印拟合多项式
yvals=p1(x)#也可以使用yvals=np.polyval(z1,x)
plot1=plt.plot(x, y, '*',label='original values')
plot2=plt.plot(x, yvals, 'r',label='polyfit values')
plt.xlabel('x axis')
plt.ylabel('y axis')
plt.legend(loc=4)#指定legend的位置,读者可以自己help它的用法
plt.title('polyfitting')
plt.show()
plt.savefig('p1.png')