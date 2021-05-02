## NumberToWord [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Ron4fun/number_to_word_english/blob/main/LICENSE) [![Build Status](https://travis-ci.com/Ron4fun/number_to_word_english.svg?branch=main)](https://travis-ci.com/Ron4fun/number_to_word_english)

**`NumberToWord`** is a library written in **Dart** language that converts numbers(integers) to the English language number representation system and in many different customizable formats.

## Usage

A simple usage example:

```dart
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
```
License
----------
    Copyright (c) 2021 Mbadiwe Nnaemeka Ronald ron2tele@gmail.com

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the author be held liable for any damages
    arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
    
    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation must be
    specified.
    
    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.
    
    3. This notice may not be removed or altered from any source distribution.
        
     
#### Tip Jar
* :dollar: **Bitcoin**: `1Mcci95WffSJnV6PsYG7KD1af1gDfUvLe6`
