from numpy import array, zeros, argmin, inf
from numpy.linalg import norm
import matplotlib.pyplot as plt


def dtw(x, y, dist=lambda x, y: norm(x - y, ord=1)):
    """ Computes the DTW of two sequences.

    :param array x: N1*M array
    :param array y: N2*M array
    :param func dist: distance used as cost measure (default L1 norm)

    Returns the minimum distance, the accumulated cost matrix and the warp path.

    """
    x = array(x)
    if len(x.shape) == 1:
        x = x.reshape(-1, 1)
    y = array(y)
    if len(y.shape) == 1:
        y = y.reshape(-1, 1)

    r, c = len(x), len(y)

    D = zeros((r + 1, c + 1))
    D[0, 1:] = inf
    D[1:, 0] = inf

    for i in range(r):
        for j in range(c):
            D[i+1, j+1] = dist(x[i], y[j])

    for i in range(r):
        for j in range(c):
            D[i+1, j+1] += min(D[i, j], D[i, j+1], D[i+1, j])

    D = D[1:, 1:]

    dist = D[-1, -1] / sum(D.shape)

    return dist, D, _trackeback(D)


def _trackeback(D):
    i, j = array(D.shape) - 1
    p, q = [i], [j]
    while (i > 0 and j > 0):
        tb = argmin((D[i-1, j-1], D[i-1, j], D[i, j-1]))

        if (tb == 0):
            i = i - 1
            j = j - 1
        elif (tb == 1):
            i = i - 1
        elif (tb == 2):
            j = j - 1

        p.insert(0, i)
        q.insert(0, j)

    p.insert(0, 0)
    q.insert(0, 0)
    return (array(p), array(q))

#x = open("", "r")
#y = open("", "r")

ctem = x.readlines()
hmno = y.readlines()


ctemp_reading=[]
hmno_reading=[]
for reading in ctem:        
     ctemp = reading.split("\r")
     
for reading in ctemp:
    ctemp_reading.append(float(reading))

for reading in hmno:        
     hmnom = reading.split("\r")
     
for reading in hmnom:
    hmno_reading.append(float(reading))

plt.axis((0,16000,-8,8))
#plt.plot(ctemp_reading)
#plt.plot(hmno_reading)

for read in ctemp_reading:
    if (ctemp_reading!=0) and (hmno_reading!=0):  
        dist, cost, path = dtw(ctemp_reading, hmno_reading)
    
print 'Minimum distance found:', dist


plt.imshow(cost.T, origin='lower', cmap=plt.cm.gray, interpolation='nearest')
plt.plot(path[0], path[1], 'w')
plt.xlim((8, cost.shape[0]))
plt.ylim((-8, cost.shape[1]))
plt.show()
