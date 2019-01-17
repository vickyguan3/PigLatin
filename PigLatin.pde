public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int i = 0; i < sWord.length(); i++)
       if(sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || 
          sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u')
      return i;
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord

//For words that are all consonants, simply add "ay" to the end of the word. Thus, "try" becomes "tryay".
//For words that begin with vowels, simply add "way" to the end of the word. Thus, "a" becomes "away"; "at" becomes "atway"; "ermine" becomes "ermineway."
//For words beginning with "qu," move the "qu" to the end of the word and add ay. Thus "question" becomes "estionquay".
//For words that begin with consonants, move the leading consonant(s) to the end of the word and add "ay." Thus, "ball" becomes "allbay"; 
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(sWord.charAt(0) == 'a' || sWord.charAt(0) == 'e' || 
          sWord.charAt(0) == 'i' || sWord.charAt(0) == 'o' || sWord.charAt(0) == 'u')
	{
		return sWord + "way";
	}
	else if (sWord.charAt(0) == 'q' && sWord.charAt(1) == 'u')
	{
		return sWord.substring(2) + "quay";
	}
	else 
	{
		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0,findFirstVowel(sWord)) + "ay";
	}
}
