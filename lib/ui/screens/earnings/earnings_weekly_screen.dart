import 'package:flutter/material.dart';

import 'earnings_chart/bar_graph_chart.dart';
import 'earnings_chart/chart_model.dart';

class EarningsWeeklyScreen extends StatelessWidget {
  const EarningsWeeklyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BarGraphChart(
        data: data1,
      ),
    );
  }
}