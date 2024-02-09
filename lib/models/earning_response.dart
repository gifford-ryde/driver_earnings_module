class Earnings {
  final double net;
  final Map<String, double> subcategories;
  final Map<String, int> trip;
  final String date;

  Earnings({
    required this.net,
    required this.subcategories,
    required this.trip,
    required this.date,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) {
    Map<String, String> keyMapping = {
      "rydePay": "RydePay",
      "cash": "Cash Collected",
      "bonus": "Bonus",
      "tip": "Tips",
      "serviceFee": "Service Fee",
      "platformFee": "Platform Fee",
      "toll": "Toll (ERP)",
    };

    return Earnings(
      net: (json['net'] as num).toDouble(),
      subcategories: Map<String, double>.from(json['subcategories'].map(
          (key, value) =>
              MapEntry(keyMapping[key], (value as num).toDouble()))),
      trip: Map<String, int>.from(json['trip'].map(
          (key, value) => MapEntry(key, value as int))),
      date: json.containsKey('start') ? '${json['start'].substring(0, 6).replaceAll('-', ' ')} - ${json['end'].substring(0, 6).replaceAll('-', ' ')}' : '',
    );
  }
}
