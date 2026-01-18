class MinMaxRules {
  int? min;
  int? max;
  int? exact;

  MinMaxRules({this.min, this.max, this.exact});

  factory MinMaxRules.fromJson(Map<String, dynamic> json) => MinMaxRules(
        min: json['min'] as int?,
        max: json['max'] as int?,
        exact: json['exact'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
        'exact': exact,
      };
}
