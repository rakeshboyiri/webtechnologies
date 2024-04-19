def substring(main,sub):
    
    m = len(main)
    n = len(sub)
    for i in range(m-n+1):
        if(sub[0]==main[i]):
            flag = True
            for j in range(1,n):
                if(sub[j]!=main[i+j]):
                    flag = False 
                    break
            if(flag):
                return i
    return -1
main="abcdefghi"
sub = "ghi"
print(substring(main,sub))
