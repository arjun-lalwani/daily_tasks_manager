import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WeightChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  WeightChart({this.animate, this.seriesList});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // behaviors: [charts.PanAndZoomBehavior()],
      defaultRenderer: charts.LineRendererConfig(includePoints: true),
    );
  }

  /// Creates a [LineChart] with sample data and no transition.
  factory WeightChart.withSampleData() {
    return new WeightChart(
      seriesList: _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2020, 7, 20), 63),
      new TimeSeriesSales(new DateTime(2020, 7, 22), 62.7),
      new TimeSeriesSales(new DateTime(2020, 7, 23), 62.4),
      new TimeSeriesSales(new DateTime(2020, 7, 24), 62),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
