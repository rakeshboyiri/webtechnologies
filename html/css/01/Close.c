#include<stdio.h>
#include<math.h>
#include<stdlib.h>



struct Points{
    int x;
    int y;
};

void mergeSort(struct Points p[],int ,int);
void merge(struct Points p[],int,int ,int);
double cp(struct Points p[],int ,int);
double bruteforce(struct Points p[],int start,int end);
double bruteforce(struct Points p[],int start,int end);

void main(){
    int n = 3;
    struct Points p[n];

    int xval[] = {1,3,5};
    int yval[] = {1,1,4};
    int i,j ,k;

    for( i =0 ;i<n;i++){
        p[i].x=xval[i];
        p[i].y = yval[i];
    }

    for(i=0;i<n;i++){
        printf("P(%d,%d)\n",p[i].x,p[i].y);
    }
    printf("After sorted\n");
    mergeSort(p,0,n-1);
    for(i=0;i<n;i++){
        printf("P(%d,%d)\n",p[i].x,p[i].y);
    }

    double distance = cp(p,0,n-1);
    printf("Distance = %f\n",distance);

}

void mergeSort(struct Points p[],int low ,int high){
    if(low<high){
        int mid = (low+high)/2;
        mergeSort(p,low,mid);
        mergeSort(p,mid+1,high);
        merge(p,low,high,mid);
    }
}
void merge(struct Points p[],int low,int high,int mid){
    int i = low,k=low;
    int j = mid+1;
    struct Points temp[high+1];
    while(i<=mid && j<=high){
        if(p[i].x<p[j].x){
            temp[k++] = p[i++];
            
        }
        else{
            temp[k++] = p[j++];
        }
    }
    while(i<=mid){
        temp[k++] = p[i++];
    }
    while(j<=high){
        temp[k++] = p[j++];
    }
    for(i=low;i<=high;i++){
        p[i] = temp[i];
    }
}

double cp(struct Points p[],int start,int end){
    struct Points s[100];
    int k =0;
    if(start+2<end){
        int mid = (start+end)/2     ;
        double ld = cp(p,start,mid) ;
        double rd = cp(p,mid+1,end) ;

        double d = ld>rd?rd:ld;

        for(int i = start;i<=end;i++){
            if(abs(p[i].x - p[mid].x)){
                s[k++] = p[i];
            }
        }

        double dd = bruteforce(s,0,k-1);
        return d>dd?dd:d;
    }else{
        return bruteforce(p,start,end);
    }
}

double bruteforce(struct Points p[],int start,int end){

    int i ,j;
    int min = __INT_MAX__;
    for(i=start;i<end;i++){
        double dis ;
        for(j=i+1;j<=end;j++){
            dis = sqrt((pow(p[j].x-p[i].x,2)+pow(p[j].y-p[i].y,2)));
            if(dis<min){
                min = dis;
            }
        }
    }
    return min;
}
