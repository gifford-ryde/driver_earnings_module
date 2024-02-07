import 'package:driver_earnings_module/tabs/today_earnings_tab.dart';
import 'package:driver_earnings_module/tabs/weekly_earnings_tab.dart';
import 'package:flutter/material.dart';

class EarningsPage extends StatefulWidget {
  const EarningsPage({super.key});

  @override
  State<EarningsPage> createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  bool openMonthlyStatement = false;

  void handleOpenMonthlyStatement() {
    setState(() {
      openMonthlyStatement = true;
    });
    print("Open Monthly Statement");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Earnings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: handleOpenMonthlyStatement,
              icon: const Icon(Icons.open_in_new),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: TabBar(
                  tabs: const [
                    Text('Today'),
                    Text('Weekly'),
                    Text('Monthly'),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[800],
                  ),
                  labelPadding: const EdgeInsets.symmetric(vertical: 10.0), 
                  labelColor: Colors.white70,
                  dividerColor: Colors.transparent,
                  //use overlayColor to change the color of the background of tab on click
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.transparent; // Use the default value.
                    },
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  TodayEarningsTab(),
                  WeeklyEarningsTab(),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
