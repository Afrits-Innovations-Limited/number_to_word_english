import 'package:number_to_word_english/number_to_word_english.dart';
import 'package:test/test.dart';

void main() {
  void RunChecker(
      [Map<int, String>? values,
      ReadType read_type = ReadType.Default,
      String delimiter = ',',
      SpacingType spacing_type = SpacingType.Right]) {
    for (var val in values!.keys) {
      final expected = values[val];
      final result =
          NumberToWord.Convert(val, read_type, delimiter, spacing_type);

      expect(expected, equals(result));
    }
  }

  group('ConvertMethodTest', () {
    test('Units', () {
      final values = {0: 'zero', 1: 'one', 5: 'five', 7: 'seven', 8: 'eight'};
      RunChecker(values);
    });

    test('Tens', () {
      final values = {
        10: 'ten',
        11: 'eleven',
        15: 'fifteen',
        17: 'seventeen',
        19: 'nineteen',
        49: 'forty nine',
        33: 'thirty three',
        67: 'sixty seven',
        75: 'seventy five'
      };
      RunChecker(values);
    });

    test('Hundreds', () {
      final values = {
        150: 'one hundred and fifty',
        110: 'one hundred and ten',
        501: 'five hundred and one',
        762: 'seven hundred and sixty two',
        893: 'eight hundred and ninety three',
        100: 'one hundred',
        107: 'one hundred and seven',
        883: 'eight hundred and eighty three',
        419: 'four hundred and nineteen',
        210: 'two hundred and ten'
      };
      RunChecker(values);
    });

    test('Thousands', () {
      final values = {
        2021: 'two thousand and twenty one',
        5005: 'five thousand and five',
        3222: 'three thousand two hundred and twenty two',
        9214: 'nine thousand two hundred and fourteen',
        14379: 'fourteen thousand three hundred and seventy nine',
        3000: 'three thousand',
        1001: 'one thousand and one',
        18999: 'eighteen thousand nine hundred and ninety nine',
        46790: 'forty six thousand seven hundred and ninety',
        112105: 'one hundred and twelve thousand one hundred and five'
      };
      RunChecker(values);
    });

    test('Millions', () {
      final values = {
        1500001: 'one million five hundred thousand and one',
        18937640:
            'eighteen million nine hundred and thirty seven thousand six hundred and forty',
        333888777:
            'three hundred and thirty three million eight hundred and eighty eight thousand seven hundred and seventy seven',
        4239875:
            'four million two hundred and thirty nine thousand eight hundred and seventy five',
        11111111:
            'eleven million one hundred and eleven thousand one hundred and eleven'
      };
      RunChecker(values);
    });

    test('Billions', () {
      final values = {
        1000000013: 'one billion and thirteen',
        163370023437:
            'one hundred and sixty three billion three hundred and seventy million twenty three thousand four hundred and thirty seven'
      };
      RunChecker(values);
    });

    test('Trillions', () {
      final values = {
        3000000000000: 'three trillion',
        14000000000003: 'fourteen trillion and three'
      };
      RunChecker(values);
    });

    test('Quadrillions', () {
      final values = {
        45004500450045004:
            'forty five quadrillion four trillion five hundred billion four hundred and fifty million forty five thousand and four'
      };
      RunChecker(values);
    });
  });

  group('ReadTypeTest', () {
    test('Default', () {
      final values = {
        10: 'ten',
        2001: 'two thousand and one',
        545: 'five hundred and forty five',
        77231: 'seventy seven thousand two hundred and thirty one',
        8919: 'eight thousand nine hundred and nineteen'
      };
      RunChecker(values, ReadType.Default);
    });

    test('Single', () {
      final values = {
        10: 'one, zero',
        2001: 'two, zero, zero, one',
        545: 'five, four, five',
        77231: 'seven, seven, two, three, one',
        8919: 'eight, nine, one, nine'
      };
      RunChecker(values, ReadType.Single);
    });

    test('Double', () {
      final values = {
        10: 'ten',
        2001: 'twenty, one',
        545: 'fifty four, five',
        77231: 'seventy seven, twenty three, one',
        8919: 'eighty nine, nineteen'
      };
      RunChecker(values, ReadType.Double);
    });
  });

  group('DelimiterSpacingTest', () {
    test('ReadType: Single, Delimeter: and, SpacingType: Both', () {
      final values = {
        10: 'one and zero',
        2001: 'two and zero and zero and one',
        545: 'five and four and five',
        77231: 'seven and seven and two and three and one',
        8919: 'eight and nine and one and nine'
      };
      RunChecker(values, ReadType.Single, 'and', SpacingType.Both);
    });

    test('ReadType: Single, Delimeter: ,, SpacingType: Right', () {
      final values = {
        10: 'one, zero',
        2001: 'two, zero, zero, one',
        545: 'five, four, five',
        77231: 'seven, seven, two, three, one',
        8919: 'eight, nine, one, nine'
      };
      RunChecker(values, ReadType.Single, ',', SpacingType.Right);
    });

    test('ReadType: Double, Delimeter: and, SpacingType: Both', () {
      final values = {
        10: 'ten',
        2001: 'twenty and one',
        545: 'fifty four and five',
        77231: 'seventy seven and twenty three and one',
        8919: 'eighty nine and nineteen'
      };
      RunChecker(values, ReadType.Double, 'and', SpacingType.Both);
    });

    test('ReadType: Double, Delimeter: ,, SpacingType: Right', () {
      final values = {
        10: 'ten',
        2001: 'twenty, one',
        545: 'fifty four, five',
        77231: 'seventy seven, twenty three, one',
        8919: 'eighty nine, nineteen'
      };
      RunChecker(values, ReadType.Double, ',', SpacingType.Right);
    });

    test('ReadType: Single, Delimeter: ,, SpacingType: NoWrap', () {
      final values = {
        10: 'one,zero',
        2001: 'two,zero,zero,one',
        545: 'five,four,five',
        77231: 'seven,seven,two,three,one',
        8919: 'eight,nine,one,nine'
      };
      RunChecker(values, ReadType.Single, ',', SpacingType.NoWrap);
    });

    test('ReadType: Double, Delimeter: ,, SpacingType: NoWrap', () {
      final values = {
        10: 'ten',
        2001: 'twenty,one',
        545: 'fifty four,five',
        77231: 'seventy seven,twenty three,one',
        8919: 'eighty nine,nineteen'
      };
      RunChecker(values, ReadType.Double, ',', SpacingType.NoWrap);
    });
  });

  group('DelimiterAsEmtySpaceTest', () {
    test('ReadType: Single, Delimeter: ' ', SpacingType: All', () {
      final values = {
        10: 'one zero',
        2001: 'two zero zero one',
        545: 'five four five',
        77231: 'seven seven two three one',
        8919: 'eight nine one nine'
      };
      RunChecker(values, ReadType.Single, ' ', SpacingType.Both);
      RunChecker(values, ReadType.Single, '', SpacingType.Right);
      RunChecker(values, ReadType.Single, ' ', SpacingType.Left);
      RunChecker(values, ReadType.Single, '', SpacingType.NoWrap);
    });

    test('ReadType: Double, Delimeter: ' ', SpacingType: All', () {
      final values = {
        10: 'ten',
        2001: 'twenty one',
        545: 'fifty four five',
        77231: 'seventy seven twenty three one',
        8919: 'eighty nine nineteen'
      };
      RunChecker(values, ReadType.Double, ' ', SpacingType.Both);
      RunChecker(values, ReadType.Double, '', SpacingType.Right);
      RunChecker(values, ReadType.Double, ' ', SpacingType.Left);
      RunChecker(values, ReadType.Double, '', SpacingType.NoWrap);
    });
  });
}
