import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightTaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LineChart(
        LineChartData(
          lineBarsData: linesBarData1(),
        ),
      ),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    return [
      lineChartBarData2,
    ];
  }
}
