/*-Nhập vào số nguyên X (4 byte) có dấu hãy "đọc" dãy bit nhị phân của X và xuất ra màn hình.

- Cho mảng 1 chiều A gồm 32 phần tử là các số 0 hoặc 1. Hãy xây dựng số nguyên X 4 byte có các bit giống với các phần tử mảng A, sau đó xuất X ra màn hình.*/

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
        static char[] InputBinaryNum()
        {
            Console.WriteLine("Please input binary 32 element: ");
            string? B = Console.ReadLine();

            // https://learn.microsoft.com/en-us/dotnet/standard/base-types/padding
            B = B.PadLeft(32, '0');
            char[] arr = B.ToArray();
            return arr;
        }

        static int convertBinaryToInt(char[] bins)
        {
            // https://vi.wikipedia.org/wiki/B%C3%B9_2
            //Ngoài cách làm theo định nghĩa như trên ra, ta còn có thể áp dụng phương pháp bù 2 theo quy tắc sau: với biểu diễn nhị phân của một số dương cho trước, để biểu diễn số âm tương ứng, ta bắt đầu tìm từ phải sang trái cho đến khi gặp bit đầu tiên có giá trị 1.Khi gặp được bit này, ta đảo tất cả các bit từ ngay kề trước nó(tức trước bit có giá trị 1 vừa nói tới) cho đến bit cực trái, và luôn nhớ: bit cực trái là 1.

            //Ví dụ: ta cũng biểu diễn lại số nguyên −5 ở hệ thập phân sang hệ nhị phân theo quy tắc mới này(giả sử với mẫu 8 bit):

            //Bước 1: xác định số nguyên 5 ở hệ thập phân được biểu diễn trong máy tính là: 0000 0101.
            //Bước 2: bắt đầu tìm(từ phải qua trái) bit đầu tiên có giá trị 1, ta thấy, đó là bit thứ nhất(tính từ phải qua).
            //Bước 3: đảo tất cả các bit nằm trước bit thu được ở bước 2.Kết quả nhận được: 1111 1011
            //Bước 4: vì là biểu diễn số âm nên bit bên trái cùng luôn giữ là 1.

            // để đổi bin sang int, ta thực hiện nghịch đảo các bước trên để xác định số nguyên trước, xong rồi áp dụng bit trái cùng để xét dấu

            // data test -5 : 11111111111111111111111111111011
            if (bins[0] == '1')
            {
                int temp = 0;
                for (int i = 31; i > 0; i--)
                {
                    // tìm bit đầu tiền là 1 ở phải cùng
                    if (bins[i] == '1')
                    {
                        temp = i;
                        break;
                    }

                }
                for (int i = 1; i < temp; i++)
                {
                    if (bins[i] == '1')
                    {
                        bins[i] = '0';
                    }
                    else
                    {
                        bins[i] = '1';
                    }
                }
            }

            char bitTraiCung = bins[0];
            bins[0] = '0';
            int result = convertBinary2Decimal(string.Join("", bins.ToArray()));

            if (bitTraiCung=='1')
            {
                return result * -1;
            }
            return result;
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

        static int convertBinary2Decimal(string _binary, bool? printOutput = true)
        {
            char[] tablebinChars = { '0', '1' };
            char[] inputBinChars = _binary.ToCharArray();
            int lengthOfBinInput = inputBinChars.Length;

            int result = 0;
            for (int i = 0; i < lengthOfBinInput; i++)
            {
                int hextValue = Array.IndexOf(tablebinChars, inputBinChars[i]);
                result += hextValue * ((int)Math.Pow(2, lengthOfBinInput - i - 1));
            }

            if (printOutput == true)
            {
                Console.WriteLine($"convertBinary2Decimal:{FormatString(_binary)} => {result}");
            }

            return result;
        }
        static void Main(string[] args)
        {
            int X = InputIntergerX();
            string bin1 = convertDecimal2Binary(X);

            Console.WriteLine("Binary String: " + FormatString(Convert.ToString(X, 2)));
            char[] bin2 = InputBinaryNum();
            Console.WriteLine(FormatString(string.Join("", bin2.ToArray())));
            Console.WriteLine(convertBinaryToInt(bin2));
        }
    }
}