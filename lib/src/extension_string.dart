extension ZKString on String {
  /// isDouble
  bool get isDouble {
    if (this.isEmpty) {
      return false;
    }

    if (double.tryParse(this) == null) {
      return false;
    }

    return true;
  }
}
