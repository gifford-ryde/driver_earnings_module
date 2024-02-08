import 'package:flutter/material.dart';

class WeeklyEarningTabs extends StatefulWidget {
  const WeeklyEarningTabs({Key? key}) : super(key: key);

  @override
  State<WeeklyEarningTabs> createState() => _WeeklyEarningTabsState();
}

class _WeeklyEarningTabsState extends State<WeeklyEarningTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 50,
          child: PageView.builder(
            controller: PageController(viewportFraction: 1/3, initialPage:7),
            scrollDirection: Axis.horizontal,
            padEnds: false,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text('Button ${index+ 1}'),
                  onPressed: () {
                    print('Button ${index+ 1} pressed');
                  },
                ),
              );
            },
          )),
    );
  }
}
