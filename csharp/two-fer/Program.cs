using System;
using System.Collections.Generic;
using System.Text;

class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("résultat Pat: " + TwoFer.Speak("Pat"));
        Console.WriteLine("résultat sans arg: " + TwoFer.Speak());
        Console.WriteLine("résultat chaine vide: " + TwoFer.Speak(""));
    }
}
