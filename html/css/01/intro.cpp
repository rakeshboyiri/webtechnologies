/*
        Bubble Sort algorithm
        Time Complexity : O(N^2)
*/


#include<bits/stdc++.h>
using namespace std;

void mergesort(int arr[],int low,int high);
void merge(int arr[],int low,int high,int mid);



int main(){
    int n= 5,i,j; 
    int arr[] = {5,4,3,2,1};
    mergesort(arr,0,n-1);
    for(i=0;i<n;i++){
        cout<<arr[i]<<" ";
    }
    return 0;
}


void mergesort(int arr[],int low,int high){
    if(low<high){
        int mid = (low+high)/2;
        mergesort(arr,low,mid);
        mergesort(arr,mid+1,high);
        merge(arr,low,high,mid);

    }
}

void merge(int arr[],int low,int high,int mid){
    int i = low;
    int j = mid+1;
    int k = low;
    int temp[high];

    while(i<=mid && j<=high){
        if(arr[i]<arr[j]){
            temp[k++] = arr[i++];
        }else{
            temp[k++] = arr[j++];
        }
    }
    while(i<=mid){
        temp[k++] = arr[i++];
    }
    while(j<=high)
    {
        temp[k++] = arr[j++];
    }
    for(i=low;i<=high;i++){
        arr[i] = temp[i];
    }
}