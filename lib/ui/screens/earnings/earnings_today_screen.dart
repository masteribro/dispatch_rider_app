import 'package:flutter/material.dart';

import 'earnings_chart/bar_graph_chart.dart';
import 'earnings_chart/chart_model.dart';

class EarningsTodayScreen extends StatefulWidget {
  const EarningsTodayScreen({Key? key}) : super(key: key);

  @override
  State<EarningsTodayScreen> createState() => _EarningsTodayScreenState();
}

class _EarningsTodayScreenState extends State<EarningsTodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BarGraphChart(
        data: data,
      ),
    );
  }
}
