import 'package:driver_earnings_module/components/earnings_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:driver_earnings_module/models/earning_response.dart';

class TodayMainTab extends StatefulWidget {
  const TodayMainTab({super.key});

  @override
  State<TodayMainTab> createState() => _TodayMainTabState();
}

class _TodayMainTabState extends State<TodayMainTab> with AutomaticKeepAliveClientMixin<TodayMainTab>{
  Earnings? earnings;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getEarningsData();
  }

  void getEarningsData() async {
    var dio = Dio();

    try {
      Response response = await dio.get(
          'https://ecc0b02f-46d5-4787-8d34-f6d36ff7e3be.mock.pstmn.io/api/driverActivity/summary/daily');
      Earnings data = Earnings.fromJson(response.data['result']);
      setState(() {
        earnings = data;
      });
      print(earnings?.net); // Prints the net earnings
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: earnings == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink[50],
                    ),
                    child: Text(
                      'Earnings today may take up to 60 mins to refresh.',
                      style: TextStyle(
                        color: Colors.pink[400],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: EarningsCard(
                      earnings: earnings,
                      showDate: true,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
