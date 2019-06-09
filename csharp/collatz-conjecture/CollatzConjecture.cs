public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number < 1)
            throw new System.ArgumentException("number must be strictly positive and not null");
        var counter = 0;
        long longNumber = number;
        return Step(longNumber, counter);
    }


    private static int Step(long number, int counter)
    {
        long newNumber = number % 2 == 0 ? number / 2 : 3 * number + 1;
        return number == 1 ? counter : Step(newNumber, ++counter);
    }

}