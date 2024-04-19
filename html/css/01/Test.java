class Points{
    int x;
    int y ;
    boolean isborder = false;

    Points(int x,int y){
        this.x = x;
        this.y = y;
    }
}

public class Test{
    public static void main(String[] args) {
        int n = 5;
        int x[] = {2,4,4,2,3};
        int y[] = {1,1,3,3,3};

        Points p[] = new Points[n];

        for(int i = 0;i<n;i++){
            p[i] = new Points(x[i],y[i]);
        }
        checkBorder(p, n);
    }

    public static void checkBorder(Points p[],int n){
        int i , j , a,b,c,k;
        for(i=0;i<n-1;i++){
            for(j=i+1;j<n;j++){
               
                a = p[j].y - p[i].y;
                b = p[i].x - p[j].x;
                c = (p[i].x*p[j].y) - (p[j].x*p[i].y);
                double val =0;
                boolean check = true;
                for(k=0;k<n;k++){

                    val = a*p[k].x + b*p[k].y -c;
                    if(val<0){
                        check= false;
                    }
                }
                if(check==true){
                    System.out.println("-----------------------");
                    System.out.println("p1("+p[i].x+","+p[i].y+")");
                    System.out.println("p2("+p[j].x+","+p[j].y+")");
                    System.out.println("-----------------------");

                }
                
            }
        }
        
    }
}