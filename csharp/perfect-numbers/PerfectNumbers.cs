using System;
using System.Collections.Generic;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number < 1)
            throw new ArgumentOutOfRangeException("number must be an integer positive");
        switch (Factor(number).Sum())
        {
            case var s when s > number:
                return Classification.Abundant;
            case var s when s < number:
                return Classification.Deficient;
            default:
                return Classification.Perfect;
        }
    }
    public static List<int> Factor(int number)
    {
        var factors = new List<int>() {0}; // add zero for the number 1
        int max = (int)Math.Sqrt(number);  //round down
        for (int factor = 1; factor <= max; ++factor)
        { //test from 1 to the square root, or the int below it, inclusive.
            if (number % factor == 0 && number != factor)
            {
                factors.Add(factor);
                if (factor != number / factor && number / factor != number )
                    factors.Add(number / factor);
                // Don't add the square root twice and the number! 
            }
        }
        return factors;
    }
}

