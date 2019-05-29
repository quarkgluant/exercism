using System.Collections.Generic;
using System.Text;

public static class RnaTranscription
{
    public static string ToRna(string nucleotide)
    {
        Transcription transcription = new Transcription();

        StringBuilder rna = new StringBuilder(nucleotide);
        for (int index = 0; index < nucleotide.Length; index++)
        {
            rna[index] = transcription.ToRna[nucleotide[index]];
        }
        return rna.ToString();
    }

    public interface ITranscription
    {
        Dictionary<char, char> ToRna { get; }
    }

    public class Transcription : ITranscription
    {
        public Dictionary<char, char> ToRna
            => new Dictionary<char, char>()
                {
                    {'G', 'C'},
                    {'C', 'G'},
                    {'A', 'U'},
                    {'T', 'A'}
                };
    }
}