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

namespace HelloWorld
{
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

        static void Main(string[] args)
        {
            char[] bin2 = InputBinaryNum();

        }
    }
}