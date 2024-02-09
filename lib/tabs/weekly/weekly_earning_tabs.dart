import 'dart:developer';

import 'package:driver_earnings_module/components/earnings_card.dart';
import 'package:driver_earnings_module/models/earning_response.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WeeklyEarningTabs extends StatefulWidget {
  const WeeklyEarningTabs({Key? key}) : super(key: key);

  @override
  State<WeeklyEarningTabs> createState() => _WeeklyEarningTabsState();
}

class _WeeklyEarningTabsState extends State<WeeklyEarningTabs> {
  List<String> tabs = ['3', '2', '1', '0'];
  int currTab = 3;
  Earnings? earnings;

  @override
  void initState() {
    super.initState();
    getEarningsData();
  }

  void getEarningsData() async {
    var dio = Dio();

    try {
      Response response = await dio.get(
          'https://ecc0b02f-46d5-4787-8d34-f6d36ff7e3be.mock.pstmn.io/api/driverActivity/summary/weekly/?week=${tabs[currTab]}');
      Earnings data = Earnings.fromJson(response.data['result'].values.first);
      setState(() {
        earnings = data;
      });
      print(earnings?.net); // Prints the net earnings
    } catch (e) {
      log('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 65,
            padding: const EdgeInsets.all(8),
            child: PageView.builder(
              controller: PageController(
                  viewportFraction: 1 / 3, initialPage: tabs.length - 2),
              scrollDirection: Axis.horizontal,
              padEnds: false,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        currTab = index;
                      });
                      print('Button ${index + 1} pressed');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          currTab == index ? Colors.pink[400] : Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          currTab == index ? Colors.white : Colors.black),
                      side: MaterialStateProperty.all(currTab == index
                          ? BorderSide.none
                          : const BorderSide(color: Colors.grey)),
                    ),
                    child: Text('Button ${index + 1}'),
                  ),
                );
              },
            ),
          ),
          earnings == null
              ? CircularProgressIndicator()
              : Expanded(
                  child: EarningsCard(
                    earnings: earnings,
                    showDate: false,
                  ),
                )
        ],
      ),
    );
  }
}
