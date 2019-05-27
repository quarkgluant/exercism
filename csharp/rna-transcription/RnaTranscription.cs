using System.Collections.Generic;
using System.Text;

public static class RnaTranscription
{
    public static string ToRna(string nucleotide)
    {
        Dictionary<char, char> transcription = new Dictionary<char, char>()
        {
            {'G', 'C'},
            {'C', 'G'},
            {'A', 'U'},
            {'T', 'A'}
        };
        StringBuilder rna = new StringBuilder(nucleotide);
        for (int index = 0; index < nucleotide.Length; index++)
        {
            rna[index] = transcription[nucleotide[index]];
        }
        return rna.ToString();
    }
}