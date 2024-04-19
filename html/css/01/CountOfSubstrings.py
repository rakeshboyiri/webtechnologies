def countOfSubString(main,sub):
    
    m = len(main)
    n = len(sub)
    count = 0
    for i in range(m-n+1):
        if(sub[0]==main[i]):
            flag = True
            for j in range(1,n):
                if(sub[j]!=main[i+j]):
                    flag = False 
                    break
            if(flag):
                count+=1
    return count

main="ghiabghicdefghi"
sub = "ghi"
print(countOfSubString(main,sub))
