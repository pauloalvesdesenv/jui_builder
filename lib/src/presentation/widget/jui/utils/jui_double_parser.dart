class JuiDoubleParser {
  static double parse(dynamic value) {
    if (value == null) {
      return 0.0;
    }
    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }
}
