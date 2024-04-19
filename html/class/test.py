a = "abc def ghi"
a = a.split()
temp=""
for i in a:
    temp= temp+i[::-1]+" "
print(temp)