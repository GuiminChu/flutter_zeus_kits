extension ZKDateTimeFormat on DateTime {
  String get kYMDHM {
    return this.toString().substring(0, 'yyyy-MM-dd HH:mm'.length);
  }

  String get kYMDH {
    return this.toString().substring(0, 'yyyy-MM-dd HH'.length);
  }

  String get kYMD {
    return this.toString().substring(0, 'yyyy-MM-dd'.length);
  }

  String get kYM {
    return this.toString().substring(0, 'yyyy-MM'.length);
  }

  String get kY {
    return this.toString().substring(0, 'yyyy'.length);
  }
}

extension ZKDate on DateTime {
  /// 月份的最后一天
  int get lastDay {
    return _calcDateCount(this.year, this.month);
  }
}

/// 计算每月天数
int _calcDateCount(int year, int month) {
  if (_leapYearMonths.contains(month)) {
    return 31;
  } else if (month == 2) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
      return 29;
    }
    return 28;
  }
  return 30;
}

/// 闰月
const List<int> _leapYearMonths = const <int>[1, 3, 5, 7, 8, 10, 12];
