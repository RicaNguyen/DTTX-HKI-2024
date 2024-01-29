//Sử dụng C/C++/C#
//Hãy viết chương trình nhập vào 2 dãy bit nhị phân 8bit bù 2

//Hãy xây dựng các thuật toán +, -, *, / trên số nhị phân có dấu để tính và xuất kết quả tương ứng.
//----

//BÁO CÁO: ĐÂY LÀ PHẦN BẮT BUỘC SV KHÔNG THỰC HIỆN SẼ KHÔNG ĐƯỢC CHẤM ĐIỂM

//Làm trên MSWORD gồm các nội dung sau:

//Phần 1: Đánh Giá

//- Bảng tự đánh giá các yêu cầu đã hoàn thành

//- Đánh giá tổng thể mức độ hoàn thành của bài nộp theo %

//Phần 2: Kết quả bài làm

//- Chụp hình lại màn hình kết quả tương ứng với từng yêu cầu.

using System.Xml;

namespace HelloWorld
{

    class SoBu2
    {
        static int MAX_BIT = 8;
        public char[] bits = new char[MAX_BIT];

        public SoBu2()
        {
            this.bits = new char[MAX_BIT];
            for (int i = 0; i < MAX_BIT; i++)
            {
                bits[i] = '0';
            }

        }
        public SoBu2(string strBinary)
        {
            this.bits = strBinary.ToCharArray();
        }

        public SoBu2(char[] bin)
        {
            this.bits = bin;

        }
        public void ChuyenSangBu2()
        {
            //chuyen sang bù 1
            for (int a = 0; a < MAX_BIT; a++)
            {
                if (bits[a] == '0')
                {
                    bits[a] = '1';
                }
                else
                {
                    bits[a] = '0';
                }
            }

            //Cong 1 vao vi tri 0 - phai cung to chuyen sang bu 2
            int bien_nho = 1;
            int i = MAX_BIT - 1;

            while (bien_nho > 0 && i > 0)
            {
                bien_nho--;
                if (bits[i] == '0')
                {
                    bits[i] = '1';
                    break;
                }
                else
                {
                    bits[i] = '0';
                    bien_nho++;
                }

                i--;
            }

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

        public void PrintBinary()
        {
            Console.WriteLine(FormatString(string.Join("", bits)));
        }

        public SoBu2 Cong(SoBu2 myBit)
        {
            SoBu2 result = new SoBu2();
            for (int i = 0; i < MAX_BIT; i++)
            {
                result.bits[i] = '0';
            }

            int bienSo = 0;
            for (int i = MAX_BIT - 1; i >= 0; i--)
            {
                if (this.bits[i] == '1' && myBit.bits[i] == '1')
                {
                    if (bienSo > 0)
                    {
                        result.bits[i] = '1';
                        bienSo -= 1;
                    }

                    bienSo += 1;
                }
                else if (this.bits[i] == '1' || myBit.bits[i] == '1')
                {
                    result.bits[i] = '1';
                    if (bienSo > 0)
                    {
                        result.bits[i] = '0';
                        bienSo += 1;
                    }
                }
                else if (this.bits[i] == '0' && myBit.bits[i] == '0')
                {
                    result.bits[i] = '0';
                    if (bienSo > 0)
                    {
                        result.bits[i] = '1';
                        bienSo -= 1;
                    }
                }
            }

            return result;
        }

        public SoBu2 Tru(SoBu2 myBit)
        {
            // A – B = A + (-B) = A + (số bù 2 của B
            myBit.ChuyenSangBu2();
            return this.Cong(myBit);
        }

        public static char[] DichPhai(char[] bits)
        {
            char[] temp = new char[bits.Length];

            for (int i = 1; i < temp.Length; i++)
            {
                temp[i] = bits[i - 1];
            }
            temp[0] = bits[0];

            bool flag = true;

            for (int i = 0; i < temp.Length; i++)
            {
                if (temp[i] == '0')
                {
                    flag = true;
                }

            }

            if (flag)
            {
                temp[0] = '0';
            }
            return temp;

        }

        public SoBu2 Nhan(SoBu2 myBit)
        {
            char[] A = new SoBu2().bits;
            char[] M = this.bits;
            char[] Q = myBit.bits;
            char Q1 = '0';
            int k = MAX_BIT;

            while (k > 0)
            {

                char[] M_temp = new char[M.Length];
                Array.Copy(M, M_temp, M.Length);

                if (Q.Last() == '1' && Q1 == '0')
                {
                    A = new SoBu2(A).Tru(new SoBu2(M_temp)).bits;

                }
                if (Q.Last() == '0' && Q1 == '1')
                {
                    A = new SoBu2(A).Cong(new SoBu2(M_temp)).bits;
                }

                //Shift right[A, Q, Q - 1]
                A = SoBu2.DichPhai(A);
                Q = SoBu2.DichPhai(Q);



                if (Q1 == '1')
                {
                    Q1 = '0';
                }
                else
                {
                    Q1 = '1';
                }


                k = k - 1;
            }

            return new SoBu2(A.Concat(Q).ToArray());
        }
    }
    class Program
    {
        static int MAX_BYTE = 8;
        static char[] InputBinaryNum()
        {
            Console.WriteLine("Please input binary 8 element: ");
            string? B = Console.ReadLine();

            // https://learn.microsoft.com/en-us/dotnet/standard/base-types/padding
            // B = B.PadLeft(32, '0');
            if (B.Length != MAX_BYTE)
            {
                throw new Exception("Please input binary 8 element");
            }
            char[] arr = B.ToArray();

            foreach (char charItem in arr)
            {
                if (charItem != '0' && charItem != '1')
                {
                    throw new Exception("Please input binary 8 element");
                }
            }

            return arr;
        }

        static string BinaryToString(char[] bits)
        {
            return string.Join("", bits);
        }

        static void Main(string[] args)
        {
            char[] bin2_number1 = InputBinaryNum();
            char[] bin2_number2 = InputBinaryNum();

            Console.WriteLine($"{BinaryToString(bin2_number1)}+{BinaryToString(bin2_number2)}=");
            new SoBu2(bin2_number1).Cong(new SoBu2(bin2_number2)).PrintBinary();

            Console.WriteLine($"{BinaryToString(bin2_number1)}-{BinaryToString(bin2_number2)}=");
            new SoBu2(bin2_number1).Tru(new SoBu2(bin2_number2)).PrintBinary();

            Console.WriteLine($"{BinaryToString(bin2_number1)}*{BinaryToString(bin2_number2)}=");
            new SoBu2(bin2_number1).Nhan(new SoBu2(bin2_number2)).PrintBinary();

            // -7 +5 = -2 = 11111110
            //new SoBu2("11111001").Cong(new SoBu2("00000101")).PrintBinary();

            //// -4 +4 = 0 = 0000000
            //new SoBu2("11111100").Cong(new SoBu2("00000100")).PrintBinary();

            //// 3 +4 = 7 = 00000111
            //new SoBu2("00000011").Cong(new SoBu2("00000100")).PrintBinary();

            //// -4 -1 = -5 = 11111011
            //new SoBu2("11111100").Cong(new SoBu2("11111111")).PrintBinary();

            //// 120 +120 = 9 = overflow
            //new SoBu2("01111000").Cong(new SoBu2("01111000")).PrintBinary();

            //// Phép trừ
            //// 2 - 7 = -5 = 11111011
            //new SoBu2("00000010").Tru(new SoBu2("00000111")).PrintBinary();

            //// 5 - 2 = 3 = 00000011
            //new SoBu2("00000101").Tru(new SoBu2("00000010")).PrintBinary();

            //// -5 - 2 = -7 = 11111001
            //new SoBu2("11111011").Tru(new SoBu2("00000010")).PrintBinary();

            // Phép nhân MXQ 7x(-3)
            //Console.WriteLine("phep nhan 1110 1011");
            //char[] nhan1 = new SoBu2("0111").Nhan(new SoBu2("1101"));
            //Console.WriteLine(nhan1);
        }
    }
}