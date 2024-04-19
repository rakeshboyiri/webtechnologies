import java.util.Scanner;

class Items{
    int item_no;
    float item_profift;
    float item_weight;
    float item_ratio;
    boolean stored =false;
}

public class Knapsack{
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
       // System.out.print("Enter the number of items");
        int n = 1;
      //  System.out.print("Enter the total capacity  : ");
        float total_profit = 0;
        float capacity = 10;

        Items item[] = new Items[n];

        //  int iteid[] = {1,2,3,4,5,6,7};
        //  float itepro[] ={5,10,15,7,8,9,4}; 
        //  float itewit[] = {1,3,5,4,1,3,2};

        int iteid[] = {1};
        float itepro[] ={500}; 
        float itewit[] = {30};

         

        float item_ratios[] = new float[n]; 

        for(int i = 0 ; i<n;i++){
            item[i] = new Items();
           // System.out.println("Enter the "+(i+1)+" items details");
           // System.out.print("Enter item no : ");
           // item[i].item_no = sc.nextInt();
           // System.out.print("Enter the item profit : ");
           // item[i].item_profift = sc.nextFloat();
           // System.out.print("Enter the item weight : ");
           // item[i].item_weight = sc.nextFloat();
           
            
            item[i].item_no = iteid[i];
            item[i].item_profift = itepro[i];
            item[i].item_weight = itewit[i];

            item_ratios[i] = (item[i].item_profift/item[i].item_weight);
            item[i].item_ratio = item_ratios[i];

        }
        sort(item_ratios);

        
        
        int i = 0;
        while(capacity>0){
            
            for (Items j :  item){
                 if(item_ratios[i]==j.item_ratio && j.stored==false){
                     if(capacity>j.item_weight ){
                         total_profit+=j.item_profift;
                         capacity-=j.item_weight;
                     }
                     else{
                         total_profit+= (capacity/j.item_weight)*j.item_profift;
                         capacity-=(capacity/j.item_weight)*j.item_profift;
                     }
                    
                     j.stored=true;
                     break;
                 }
                 
            }
            i++;
            if(i==n){
             break;
            }
         
         }
        System.out.println("Total profit : "+total_profit);
        

    } 

    public static void sort(float a[]){
        for(int i = 0 ;i<a.length;i++){
            for(int j = i+1 ;j<a.length;j++){
                if(a[i]<a[j]){
                    float temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }
            }
        }
    }
}

