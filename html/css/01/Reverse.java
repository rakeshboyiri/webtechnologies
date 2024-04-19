public class Reverse {
    public static void main(String[] args) {
        String str1 = "123456";
        String str2 = "";
        char ch[] = str1.toCharArray();
        int low = 0;
        int high = ch.length-1;
        while(low<high){
            char temp = ch[low];
            ch[low] = ch[high];
            ch[high] = temp;
            low++;
            high--;
        }
        str2 = new String(ch);
        System.out.println(str2);
    }
}
