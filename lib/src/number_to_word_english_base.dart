/*
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

    3. This notice must not be removed or altered from any source distribution.
*/

import 'dart:core';

/// This exception indicates that there exist an issue with the argument passed.
class FormatException implements Exception {
  String cause;
  FormatException(this.cause);
} // end class FormatException

/// This exception indicates that the argument passed is null.
class ArgumentNullException implements Exception {
  String cause;
  ArgumentNullException(this.cause);
} // end class ArgumentNullException

/// ReadType enum determines how the numbers are interpreted.
///
/// ```dart
///   // Default: Represents the normal English language interpretation.
///   // Single: Represents that the numbers are interpreted one by one.
///   // Double: Represents that the numbers are interpreted two by two.
/// ```
enum ReadType {Default, Single, Double} // End enum ReadType


/// SpacingType enum determines the spacing on the delimiter.
/// Note: When delimiter is an empty string i.e ' ', then spacing type is not used.
///
/// ```dart
///   // Both: Represents spacing on both side of the delimiter.
///   // Left: Represents spacing on the left side of the delimiter.
///   // Right: Represents spacing on the right side of the delimiter.
///   // NoWrap: Represents no spacing at both sides of the delimiter.
/// ```
enum SpacingType {Both, Left, Right, NoWrap} // End enum SpacingType

/// NumberToWord: Converts integer numbers to English Language representation only.
///
/// ```dart
/// NumberToWord.Convert(1994, ReadType.Double, 'and', SpacingType.Both) == "nineteen and ninety four";
/// ```
class NumberToWord {
  /// MaxInteger represents the maximum allowed integer.
  static const int MaxInteger = 999999999999999999;

  static final Map<String, String> _NumArray = {
    '1': 'one',
    '2': 'two',
    '3': 'three',
    '4': 'four',
    '5': 'five',
    '6': 'six',
    '7': 'seven',
    '8': 'eight',
    '9': 'nine',
    '10': 'ten',
    '11': 'eleven',
    '12': 'twelve',
    '13': 'thirteen',
    '14': 'fourteen',
    '15': 'fifteen',
    '16': 'sixteen',
    '17': 'seventeen',
    '18': 'eighteen',
    '19': 'nineteen',
    '20': 'twenty',
    '30': 'thirty',
    '40': 'forty',
    '50': 'fifty',
    '60': 'sixty',
    '70': 'seventy',
    '80': 'eighty',
    '90': 'ninety'
  };

  static final List<String> _UnitsArray = ['','thousand','million','billion','trillion','quadrillion'];

  /// Returns the string representation of the integer passed
  /// i.e passing the [digits], [read_type], [delimiter] and or [spacing_type] as arguments.
  ///
  /// Note: When delimiter is an empty string i.e ' ', then spacing type is not used. And [read_type] of ReadType.Default
  /// does not make use of [delimiter] and [spacing_type] arguments.
  ///
  /// ```dart
  /// print(NumberToWord.Convert(1994, ReadType.Double, ',', SpacingType.Right); // nineteen, ninety four
  /// ```
  static String Convert([int digits, ReadType read_type = ReadType.Default, String delimiter = ',', SpacingType spacing_type = SpacingType.Right]) {

    var digitsString = digits.toString();
    var wordings = '';

    delimiter = _ResolveDelimiter(delimiter, spacing_type);

    if (read_type == ReadType.Default) {
      return NumberToWord._GetAmountInStr(digits);
    } // end if
    else if (read_type == ReadType.Single) {
      for (var i = 0; i < digitsString.length; i++) {
        wordings += ((i == 0 ? '':delimiter) + NumberToWord._GetAmountInStr(int.parse(digitsString[i])));
      } // end for

      return wordings;
    } // end else if
    else if (read_type == ReadType.Double) {
      var stopIndex = 0;

      for (var i = 0; i < digitsString.length - 2; i+=2) {
        wordings += ((i == 0 ? '':delimiter) + NumberToWord._GetAmountInStr(int.parse(digitsString.substring(i, i+2))));
        stopIndex = i + 2;
      } // end for

      wordings += ((wordings.isEmpty ? '':delimiter) + NumberToWord._GetAmountInStr(int.parse(digitsString.substring(stopIndex))));

      return wordings;
    } // end else if

    throw FormatException('ReadType is unknown');
  }

  /// Returns the resolved delimiter representation.
  static String _ResolveDelimiter([String delimiter, SpacingType spacing]) {
    delimiter = delimiter.trim();

    if (delimiter.isEmpty) {
      return ' ';
    }

    //
    if (spacing == SpacingType.NoWrap) {
      return delimiter;
    }
    else if (spacing == SpacingType.Both) {
      return ' ' + delimiter + ' ';
    }
    else if (spacing == SpacingType.Left) {
      return ' ' + delimiter;
    }
    else if (spacing == SpacingType.Right) {
      return delimiter + ' ';
    }

    throw FormatException('SpacingType is unknown');
  } // end function _ResolveDelimiter

  /// Returns a string form of the digits in English language representation only.
  /// throws an exception if argument is incorrectly formatted.
  ///
  /// ```dart
  /// NumberToWord._GetAmountInStr(5) == "five";
  /// ```
  static String _GetAmountInStr(int digits) {
    if (digits == null) {
      throw ArgumentNullException('digits cannot be null');
    }
    if (digits > MaxInteger) {
      throw FormatException('digits is too large');
    }
    if (digits == 0) return 'zero';

    var oldStr = digits.toString();
    var length = oldStr.length;
    var counter = 0; // check when to split number in 3's

    var v = ''; // holds at most 3 digits to be put in list x
    var x = []; // holds the 3digit string + ",", as an element

    for (var i = length - 1; i > -1; i--) // loop through the string bottom to top
    {
      if (counter % 3 == 0 && counter != 0) {
          //digits are in reverse order, so we are puting them back in the right order
          // call reverse function in list to reverse there order
          var s = v.split('').reversed.join(); // create an empty temp str object
          // store temp data in v

          x.add(s); // put v in list
          v = ''; // empty string object
      }

      v += oldStr[i]; // hold at most 3 digit in reverse order, space is to enable split function in str
      counter += 1; // increment counter
    }

    // in-case there are some digits been held by v
    // convert to list
    // call reverse function in list to reverse there order
    var s = v.split('').reversed.join(); // create an empty temp str object
    x.add(s); // put v in list

    var tempList=[]; // hold new words list

    for (var i = 0; i < x.length; i++) {
      if (NumberToWord._toStr(x[i]).isNotEmpty) {
        if (NumberToWord._UnitsArray[i].isEmpty) {
          if (x.length > 1 && int.parse(x[0]) < 100) {
            tempList.add('and ' + NumberToWord._toStr(x[i]) + ' ' + NumberToWord._UnitsArray[i] + ' ');
            continue;
          }
        }

        tempList.add(NumberToWord._toStr(x[i]) + ' ' + NumberToWord._UnitsArray[i] + ' ');
      }
    }

    // reverse the main list
    var newStr = tempList.reversed.join(); // store joined string in newStr object

    return newStr.trim(); // return string object
  } // end function _GetAmountInStr

  /// Returns 3 digit numbers to string.
  //  If len of value is not 3, add zero in front to make it 3 digits.
  ///
  /// ```dart
  /// NumberToWord._toStr(100) == "one hundred";
  /// ```
  static String _toStr(String value) {
    var length = value.length;

    if (length != 3) {
      for (var i = 0; i < 3 - length; i++) {
        value = '0' + value;
      }
    }

    // split value into hundred, tens and unit
    var first = value[0]; // first digit
    var second = '';
    var third = '';

    if (value[1] == '1' && value[1] != '0') {
      second = '';
      third = value.substring(1); // number 10 - 19
    }
    else {
      second = value[1] + '0'; // number 20,30,40,...,90
      third = value[2]; // last digit
    }

    // if first value is not 0
    if (first != '0') {
      for (var n in NumberToWord._NumArray.keys) {
        // if dictionary key is == digit string
        if (n == first) {
          first = NumberToWord._NumArray[n] + ' hundred'; // store the word in first
        }
      }
    }
    else {
      first = '';
    }

    // if second value is not 0
    if (!['0', '00'].contains(second)) {
      for (var n in NumberToWord._NumArray.keys) {
        // if dictionary key is == digit string
        if (n == second)
        {
          if (first != '') {
            second = ' and ' + NumberToWord._NumArray[n]; // store the word in first
          }
          else {
            second = NumberToWord._NumArray[n];
          }
        }
      }
    }
    else {
      second = '';
    }

    // if third value is not 0
    if (third != '0') {
      for (var n in NumberToWord._NumArray.keys) {
        // if dictionary key is == digit string
        if (n == third) {
          if (first.isNotEmpty && second.isEmpty) {
            third = ' and ' + NumberToWord._NumArray[n]; // store the word in first
          }
          else {
            third = ' ' + NumberToWord._NumArray[n];
          }
        }
      }
    }
    else {
      third = '';
    }

    var temp = first + second + third; // temp data to hold string

    return temp.trim(); // remove un-necessary spaces and return temp
  } // end function _toStr

} // end class NumberToWord
