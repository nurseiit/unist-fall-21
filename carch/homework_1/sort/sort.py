import random

def getOneTest():
    llen = random.randint(3,20)

    iin = [0] * llen
    for i in range(0,llen):
        iin[i] = random.randint(0,500)

    # oout = sorted(iin)
    return str(llen) + " " + " ".join(str(e) for e in iin)

numTests = 10
o = ""
for i in range(0,numTests):
    t = getOneTest()
    o += t + '\n'

with open('test.txt','w+') as f:
    f.write(o)

