import 'package:flutter/services.dart';

class ZKInputFormatter {
  static TextInputFormatter get price {
    return _PriceTextInputFormatter();
  }

  static TextInputFormatter get digitsOnly {
    return FilteringTextInputFormatter.digitsOnly;
  }
}

/// 只允许输入小数(价格)
/// @Author CGM
///
class _PriceTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;

  int preCount = 7;
  int sufCount = 2;

  _PriceTextInputFormatter({this.preCount = 7, this.sufCount = 2});

  static double _strToFloat(String str, [double defaultValue = defaultDouble]) {
    // 价格不允许有正负值
    if (str.contains('+') || str.contains('-')) {
      return defaultValue;
    }

    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
//    print('oldValue: ${oldValue.text}');
//    print('newValue: ${newValue.text}');
    String value = newValue.text;

    int selectionIndex = newValue.selection.end;

    bool haveDot = oldValue.text.contains('.');
    final array = value.split('.');

    if (value == '.') {
      value = '0.';
      selectionIndex++;
    } else if (value != '' &&
        value != defaultDouble.toString() &&
        _strToFloat(value, defaultDouble) == defaultDouble) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    } else {
      if (haveDot && array.length > 1) {
        if (array.last.length > sufCount) {
          value = oldValue.text;
          selectionIndex = oldValue.selection.end;
        }
      }
      if (array.first.length > preCount) {
        value = oldValue.text;
        selectionIndex = oldValue.selection.end;
      }
    }

    return new TextEditingValue(
      text: value,
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
