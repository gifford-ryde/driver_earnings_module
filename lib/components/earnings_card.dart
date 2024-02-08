import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:driver_earnings_module/models/daily_earning_response.dart';

class EarningsCard extends StatefulWidget {
  const EarningsCard(
      {super.key, required this.earnings, required this.showDate});
  final Earnings? earnings;
  final bool showDate;

  @override
  State<EarningsCard> createState() => _EarningsCardState();
}

class _EarningsCardState extends State<EarningsCard> {
  String date = DateFormat('dd MMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  'SGD',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  widget.earnings!.result.net.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            widget.showDate
                ? Text(
                    date,
                    style: TextStyle(fontSize: 12),
                  )
                : Container(),
            Container(
              padding: const EdgeInsets.all(10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Text(
                          widget.earnings!.result.trip.unique
                              .toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Colors.pink[400],
                          ),
                        ),
                        const Text(
                          'Unique Riders',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    width: 0,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Text(
                          widget.earnings!.result.trip.count.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Colors.pink[400],
                          ),
                        ),
                        const Text(
                          'Pickups',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      color: Colors.white,
                      child: Column(
                        children: (widget.earnings!.result.subcategories)
                            .entries
                            .map((MapEntry<String, dynamic> entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text(
                                  entry.value.toString(),
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 5,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ongoing Bonus',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              'ZERO COMISSION',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text("Drive Better. 100% Support"),
                            Text(
                              "Last Date of 0% Comms : 2 Jan 2025",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
