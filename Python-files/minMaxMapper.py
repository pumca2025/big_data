import sys
for line in sys.stdin:
    val=line.strip()
    year=val[0:4]
    temp=val[5:9]
    if temp!='9999':
        print('%s\t%s' %(year,temp))
