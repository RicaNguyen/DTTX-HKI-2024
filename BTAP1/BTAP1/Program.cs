using System;

namespace HelloWorld
{
    class Program
    {
        static char[] TableHexChars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

        static string FormatString(string str, int? n = 4, string? sep = " ")
        {
            string outString = "";
            int sodu = str.Length % (n ?? 4);

            outString = str.Substring(0, sodu);

            for (int i = sodu; i < str.Length; ++i)
            {
                if ((i - sodu) % n == 0)
                {
                    outString += sep;
                }

                outString += str[i];
            }

            return outString;
        }

        /*10-2*/
        static string convertDecimal2Binary(int _dec, bool? printOutput = true)
        {
            Stack<string> bin = new Stack<string>();
            int dec = _dec;
            int temp;
            for (int i = 0; dec > 0; i++)
            {
                temp = dec % 2;
                bin.Push(temp + "");
                dec = dec / 2;
            }

            string result = string.Join("", bin.ToArray());
            if (printOutput == true)
            {
                Console.WriteLine($"convertDecimal2Binary:{_dec} => {FormatString(result)}");
            }

            return result;
        }

        /*10-16*/
        static string convertDecimal2Hex(int _dec, bool? printOutput = true)
        {
            Stack<char> hex = new Stack<char>();
            int temp;
            int dec = _dec;
            for (int i = 0; dec > 0; i++)
            {
                temp = dec % 16;
                hex.Push(TableHexChars[temp]);
                dec = dec / 16;
            }

            string result = string.Join("", hex.ToArray());
            if (printOutput == true)
            {
                Console.WriteLine($"convertDecimal2Hex:{_dec} => {FormatString(result)}");
            }


            return result;
        }

        /*16-10*/
        static int convertHex2Decimal(string _hex, bool? printOutput = true)
        {
            char[] inputHexChars = _hex.ToCharArray();
            int lengthOfHexInput = inputHexChars.Length;

            int result = 0;
            for (int i = 0; i < lengthOfHexInput; i++)
            {
                int hextValue = Array.IndexOf(TableHexChars, inputHexChars[i]);
                result += hextValue * ((int)Math.Pow(16, lengthOfHexInput - i - 1));
            }

            if (printOutput == true)
            {
                Console.WriteLine($"convertHex2Decimal:{FormatString(_hex)} => {result}");
            }

            return result;
        }

        /*16-2*/
        static string convertHex2Bin(string _hex, bool? printOutput = true)
        {
            // chuyen 16 sang 10, sau do chuyen 10 sang 2
            int decimalValye = convertHex2Decimal(_hex, false);
            string binaryValue = convertDecimal2Binary(decimalValye, false);

            if (printOutput == true)
            {
                Console.WriteLine($"convertHex2Bin:{FormatString(_hex)} => {FormatString(binaryValue)}");
            }

            return binaryValue;
        }

        /*2-10*/
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

        /*2-16*/
        static string convertBinary2Hex(string _binary, bool? printOutput = true)
        {
            // chuyen 2 sang 10, sau do chuyen 10 sang 16
            int decimalValye = convertBinary2Decimal(_binary, false);
            string hexValue = convertDecimal2Hex(decimalValye, false);

            if (printOutput == true)
            {
                Console.WriteLine($"convertBinary2Hex:{FormatString(_binary)} => {FormatString(hexValue)}");
            }

            return hexValue;
        }

        static void Main(string[] args)
        {
            convertDecimal2Binary(120);
            convertDecimal2Hex(120456456);

            convertHex2Decimal("75E0508");
            convertHex2Bin("75E0508");

            convertBinary2Decimal("1111000");
            convertBinary2Hex("11110011111000");
        }
    }
}