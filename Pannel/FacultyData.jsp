
<%!
int[] facultylist=new int[10];
int num=0;
int isPresent(int n)
{
    int i,flag=0;
    for(i=0;i<num;i++)
    {
        if(facultylist[i]==n)
        flag=1;
    }
return(flag);
}
%>