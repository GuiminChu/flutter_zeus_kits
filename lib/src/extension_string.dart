extension ZKString on String {
  /// isBlank
  bool get isBlank {
    return this == null || this.isEmpty;
  }

  /// isNotBlank
  bool get isNotBlank {
    return !isBlank;
  }

  /// isDouble
  bool get isDouble {
    if (this.isBlank) {
      return false;
    }

    if (double.tryParse(this) == null) {
      return false;
    }

    return true;
  }
}
