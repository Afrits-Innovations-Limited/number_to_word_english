import 'package:number_to_word_english/number_to_word_english.dart';

void main() {
  var age = 1994;
  var amount = 21560;
  var word;

  //  For Age
  word = NumberToWord.Convert(age);
  print(word); // one thousand nine hundred and ninety four

  word = NumberToWord.Convert(age, ReadType.Double, ' ');
  print(word); // nineteen ninety four

  word = NumberToWord.Convert(age, ReadType.Single, ',', SpacingType.Right);
  print(word); // one, nine, nine, four

  word = NumberToWord.Convert(age, ReadType.Single, ',', SpacingType.NoWrap);
  print(word); // one,nine,nine,four

  word = NumberToWord.Convert(age, ReadType.Double, 'and', SpacingType.Both);
  print(word); // nineteen and ninety four

  //  For Amount
  word = NumberToWord.Convert(amount);
  print(word); // twenty one thousand five hundred and sixty

  word = NumberToWord.Convert(amount, ReadType.Double);
  print(word); // twenty one, fifty six, zero

  word = NumberToWord.Convert(amount, ReadType.Single, 'and', SpacingType.Both);
  print(word); // two and one and five and six and zero

  word = NumberToWord.Convert(amount, ReadType.Single, ',', SpacingType.NoWrap);
  print(word); // two,one,five,six,zero

  word = NumberToWord.Convert(amount, ReadType.Double, 'and', SpacingType.Both);
  print(word); // twenty one and fifty six and zero
}
