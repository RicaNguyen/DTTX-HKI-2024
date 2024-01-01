using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the number to be converted:");
            // int number = Convert.ToInt32(Console.ReadLine());
            string hexnumber = Console.ReadLine();
            //hexnumber.ToArray();
            /*10-2*/
            /*            Console.WriteLine("Enter the decimal to be converted:");
                        int dec = Convert.ToInt32(Console.ReadLine());
                        Stack<string> bin = new Stack<string>();
                        int temp;
                        for (int i = 0; dec > 0; i++)
                        {
                            temp = dec % 2;
                            bin.Push(temp+"");
                            dec = dec / 2;
                        }
                        Console.WriteLine(string.Join("", bin.ToArray()));*/
            /*            foreach (int b in bin)
                            Console.Write(b);*/
            /*10-16*/
            /*Stack<string> hex = new Stack<string>();
            string[] tablehex = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F" };
            int temp;
            for (int i = 0; number > 0; i++)
            {
                temp = number % 16;
                hex.Push(tablehex[temp]);
                number = number / 16;
            }
            Console.WriteLine(string.Join("", hex.ToArray()));*/
            /*16-10*/
/*            char[] tablehexs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };


            char[] hextchars = hexnumber.ToCharArray();
            int result = 0;
            for (int i = 0; i < hextchars.Length; i++)
            {
                int hextValue = Array.IndexOf(tablehexs, hextchars[i]);
                result += hextValue * ((int)Math.Pow(16, hextchars.Length - i - 1));
            }
            Console.WriteLine(result);*/
        }
    }
}