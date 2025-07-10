class TimeAgo {
  final int value;
  final String unit; // "s", "m", "h", "d"
  final String unitLoclaizationKey;
  const TimeAgo(
      {required this.value,
      required this.unit,
      required this.unitLoclaizationKey});
}
