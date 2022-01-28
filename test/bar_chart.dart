import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {

    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(year: '08', earning: 18.5),
      EarningsTimeline(year: '09', earning: 21),
      EarningsTimeline(year: '10', earning: 30),
      EarningsTimeline(year: '11', earning: 38),
      EarningsTimeline(year: '12', earning: 42),
      EarningsTimeline(year: '13', earning: 43.5),
      EarningsTimeline(year: '14', earning: 73),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
        id: 'Subscribers',
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.year,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
      )
    ];

    return Scaffold(
      body: Center(
          child: Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: charts.BarChart(timeline, animate: true),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

class EarningsTimeline {
  final String year;
  final double earning;

  EarningsTimeline({
    required this.year,
    required this.earning,
  });
}