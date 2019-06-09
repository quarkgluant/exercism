
public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number < 1)
            throw new System.ArgumentException("number must be strictly positive and not null");
        var counter = 1;
        long longNumber = number;
        return Step(ref longNumber, ref counter);
    }

    private static int Step(ref long refNumber, ref int refCounter)
    {
        refNumber = refNumber % 2 == 0 ? refNumber / 2 : 3 * refNumber + 1;

        if (refNumber == 1)
            return refCounter;
        refCounter++;
        return Step(ref refNumber, ref refCounter);
    }

}