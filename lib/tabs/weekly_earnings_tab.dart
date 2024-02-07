import 'package:driver_earnings_module/components/earnings_card.dart';
import 'package:flutter/material.dart';

class WeeklyEarningsTab extends StatefulWidget {
  const WeeklyEarningsTab({super.key});

  @override
  State<WeeklyEarningsTab> createState() => _WeeklyEarningsTabState();
}

class _WeeklyEarningsTabState extends State<WeeklyEarningsTab> {
  Map<String, double> todayEarningsData = {
    'uniqueRiders': 0.00,
    'pickups': 0.00,
    "Today's Earnings (SGD)": 0.00,
    'RydePay': 0.00,
    'Cash Collected': 0.00,
    'Bonus': 0.00,
    'Tips': 0.00,
    'Service Fee': 0.00,
    'Platform Fee': 0.00,
    'Toll (ERP)': 0.00,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink[50],
              ),
              child: Text(
                'Earnings today will be updated after 5:00am tomorrow.',
                style: TextStyle(
                  color: Colors.pink[400],
                  fontSize: 13,
                ),
              ),
            ),
            EarningsCard(
              todayEarningsData: todayEarningsData,
              showDate: true,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
