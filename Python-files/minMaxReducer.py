from operator import itemgetter
import sys

(last_key,max_val,min_val)=(None,0,0)

for line in sys.stdin:
    (key,val)=line.strip().split("\t")
    if last_key and last_key!=key:
        print('%s\t%s\t%s' %(last_key,max_val,min_val))
        (last_key,max_val,min_val)=(key,float(val),float(val))
    else:
        (last_key,max_val,min_val)=(key,max(max_val,float(val)),min(min_val,float(val)))
        if min_val==0.0:
            min_val=max_val

if last_key:
    print('%s\t%s\t%s' %(last_key,max_val,min_val))
