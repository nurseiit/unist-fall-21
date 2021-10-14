import random


def getOneTest():
    dim = random.randint(2,5)

    a = [[0] * dim for i in range(0,dim)]
    b = [[0] * dim for i in range(0,dim)]
    res = [[0] * dim for i in range(0,dim)]

    for i in range(0,dim):
        for j in range(0,dim):
            a[i][j] = random.randint(0,50)
            b[i][j] = random.randint(0,50)


    for i in range(0,dim):
        for j in range(0,dim):
            for k in range(0,dim):
                res[i][j] += a[i][k] * b[k][j]

    out = f"{dim}"
    for i in range(0,dim):
        for j in range(0,dim):
            out += f" {a[i][j]}"
    for i in range(0,dim):
        for j in range(0,dim):
            out += f" {b[i][j]}"
    for i in range(0,dim):
        for j in range(0,dim):
            out += f" {res[i][j]}"
    return out

numTests = 10
o = ""
for i in range(0,numTests):
    t = getOneTest()
    o += t + '\n'

with open('test.txt','w+') as f:
    f.write(o)

