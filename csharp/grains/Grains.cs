public static class Grains
{
    private const int NumberMaxSquares = 64;
    private const int NumberMinSquare = 1;
    
    public static ulong Square(int n)
    {
        if (n < NumberMinSquare || n > NumberMaxSquares)
            throw new System.ArgumentOutOfRangeException("the value must be beetween 1 and 64 inclusive");
        return (ulong)1 << (n - 1);
    }

    public static ulong Total()
    {
        ulong total = 0;
        
        for (int i = NumberMinSquare; i <= NumberMaxSquares; i++)
        {
            total += Square(i);
        }
        return total;
    }
}