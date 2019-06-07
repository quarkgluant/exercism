using System;

class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("résultat 1000000 (152): " + CollatzConjecture.Steps(1000000));
        Console.WriteLine("résultat 12 (9): " + CollatzConjecture.Steps(12));
        Console.WriteLine("résultat 1547 " + CollatzConjecture.Steps(1547));
    }
}