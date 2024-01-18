/*-Nhập vào số nguyên X (4 byte) có dấu hãy "đọc" dãy bit nhị phân của X và xuất ra màn hình.

- Cho mảng 1 chiều A gồm 32 phần tử là các số 0 hoặc 1. Hãy xây dựng số nguyên X 4 byte có các bit giống với các phần tử mảng A, sau đó xuất X ra màn hình.*/

using System;

namespace HelloWorld
{
    class Program
    {
        static int InputIntergerX()
        {
            Console.WriteLine("Please input 'có dau' interger 4 byte:  ");
            int X = Convert.ToInt32(Console.ReadLine());
            return X;
        }
        static string FormatString(string str, int? n = 4, string? sep = " ")
        {
            string outString = "";
            int sodu = str.Length % (n ?? 4);

            // cắt phần đầu để bỏ qua separetor
            outString = str.Substring(0, sodu);

            // cắt từ phần sau để thêm separetor
            str = str.Substring(sodu);

            for (int i = 0; i < str.Length; ++i)
            {
                if (i % n == 0)
                {
                    outString += sep;
                }

                outString += str[i];
            }

            return outString;
        }
        static string convertDecimal2Binary(int _dec, bool? printOutput = true)
        {
            List<string> bin = new List<string>();
            int dec = Math.Abs(_dec);
            int temp;
            for (int i = 0; dec > 0; i++)
            {
                temp = dec % 2;
                bin.Insert(0, temp + "");
                dec = dec / 2;

            }


            // them dau luong
            if (_dec < 0)
            {
                bin.Insert(0, "1");
            }
            else
            {
                bin.Insert(0, "0");
            }

            // chen 0 vao cac bit trong
            while (bin.Count < 32)
            {
                bin.Insert(1, "0");
            }

            //  neu no la so am
            if (_dec < 0)
            {

                //chuyen sang bù 1
                for (int a = 1; a < bin.Count; a++)
                {
                    if (bin[a] == "0")
                    {
                        bin[a] = "1";
                    }
                    else
                    {
                        bin[a] = "0";
                    }
                }

                Console.WriteLine($"bu 1: => {FormatString(string.Join("", bin.ToArray()))}");

                //Cong 1 vao vi tri 0 - phai cung to chuyen sang bu 2

                int bien_nho = 1;
                int i = 31;

                while (bien_nho > 0 && i > 0)
                {
                    bien_nho--;
                    if (bin[i] == "0")
                    {
                        bin[i] = "1";
                        break;
                    }
                    else
                    {
                        bin[i] = "0";
                        bien_nho++;
                    }

                    i--;
                }
            }

            string result = string.Join("", bin.ToArray());

            if (printOutput == true)
            {
                Console.WriteLine($"convertDecimal2Binary:{_dec} => {FormatString(result)}");
            }

            return result;
        }


        static void Main(string[] args)
        {
            int X = InputIntergerX();
            string bin1 = convertDecimal2Binary(X);

            //Console.Write("Binary String: " + FormatString(Convert.ToString(X, 2)));
        }
    }
}