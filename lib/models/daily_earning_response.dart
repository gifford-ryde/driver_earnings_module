class Earnings {
  final bool status;
  final EarningsResult result;

  Earnings({required this.status, required this.result});

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return Earnings(
      status: json['status'],
      result: EarningsResult.fromJson(json['result']),
    );
  }
}

class EarningsResult {
  final double net;
  final Map<String, double> subcategories;
  final Trip trip;

  EarningsResult({required this.net, required this.subcategories, required this.trip});

  factory EarningsResult.fromJson(Map<String, dynamic> json) {
    return EarningsResult(
      net: (json['net'] as num).toDouble(),
      subcategories: Map<String, double>.from(json['subcategories'].map((key, value) => MapEntry(key, (value as num).toDouble()))),
      trip: Trip.fromJson(json['trip']),
    );
  }
}

class Trip {
  final int count;
  final int unique;

  Trip({required this.count, required this.unique});

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      count: json['count'],
      unique: json['unique'],
    );
  }
}