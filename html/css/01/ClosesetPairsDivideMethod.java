public class ClosesetPairsDivideMethod {
    public static void main(String[] args) {
        int n = 5;
        int x[] = {2,4,4,2,3};
        int y[] = {1,1,3,3,1};
        int i,j,k;
        Points p[] = new Points[n];

        for(i=0;i<n;i++ ){
            p[i] = new Points(x[i], y[i]);
        }

        for(i=0;i<n;i++){
            System.out.println("p("+p[i].x+","+p[i].y+")");
        }
        mergeSort(p,0,n-1);
        System.out.println("\nAfter Sorted\n");
        for(i=0;i<n;i++){
            System.out.println("p("+p[i].x+","+p[i].y+")");
        }
        double distance = cp(p,0,n-1);
        System.out.println("Distance = "+distance);

        
    }

    public static void mergeSort(Points arr[],int low,int high){
        if(low<high){
            int mid = (low+high)/2;
            mergeSort(arr, low, mid);
            mergeSort(arr, mid+1, high);
            merge(arr,low,high,mid);
        }
    }
    public static void merge(Points arr[],int low,int high,int mid){
        int i = low;
        int j = mid+1;
        int k = low;
        Points temp[] = new Points[high+1];
        while(i<=mid && j<=high){
            if(arr[i].x<arr[j].x){
                temp[k++] = arr[i++];
            }
            else{
                temp[k++] = arr[j++];
            }
        }
        while(i<=mid){
            temp[k++] = arr[i++];
        }
        while(j<=high){
            temp[k++] = arr[j++];
        }
        for(k=low;k<=high;k++){
            arr[k] = temp[k];
        }
    }

    //ClosesetPair Method
    public static double cp(Points p[],int start,int end){
        Points s[] = new Points[end+1];
        int k = 0; 
        if(start+1<end){
            int mid = (start+end)/2;
            double ld = cp(p,start,mid);
            double rd = cp(p,mid+1,end);
            double d= ld>rd?rd:ld;
            for(int i = start;i<=end;i++){
                if((Math.abs(p[i].x-p[mid].x))<d){
                    s[k++] = p[i];
                }
            }
            double bd = bruteforce(s,0,k-1);

            return bd>d?d:bd;
        }
        else{
             return bruteforce(p,start,end);
        }
    }
    public static double bruteforce(Points p[],int start,int end){
        double min = Double.MAX_VALUE;
        for(int i=start;i<end;i++){
            double d =0;
            for(int j=i+1;j<=end;j++){
                d = Math.sqrt((Math.pow(p[j].x-p[i].x,2)+Math.pow(p[j].y-p[i].y,2)));
                if(d<min){
                    min = d;
                }
            }
        }


        return min;
    }

}

class Points{
    int x;
    int y;
    Points (int x,int y){
        this.x = x;
        this.y = y;
    }
}
