import sys
wordcount={}
for line in sys.stdin:
    word,count=line.strip().split('\t')
    try:
        wordcount[word]=wordcount[word]+int(count)
    except:
        wordcount[word]=int(count)
for word in wordcount.keys():
    print('%s\t%s' %(word,wordcount[word]))
