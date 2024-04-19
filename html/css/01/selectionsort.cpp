#include<bits/stdc++.h>
using namespace std;
int main(){
    int n = 5,j,i,minimum,temp;
    int arr[] ={5,4,3,2,1};

    //algorithm
    for(i=0;i<n-1;i++){
        minimum = i;
        for(j=i+1;j<n;j++){
            if(arr[minimum]>arr[j]){
                minimum=j;
            }
        }
        if(i!=minimum){
            temp=arr[minimum];
            arr[minimum] = arr[i];
            arr[i] = temp;
        }
    }


    for(i=0;i<n;i++){
        cout<<arr[i];
    }
    cout<<arr.size();

    return 0;
}