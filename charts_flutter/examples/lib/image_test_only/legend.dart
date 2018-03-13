// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Legend example for image tests only.
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ImageTestLegend extends StatelessWidget {
  final List<charts.Series> seriesList = _createSampleData();
  final charts.BuildablePosition position;
  final TextDirection textDirection;

  ImageTestLegend(this.position, this.textDirection);

  factory ImageTestLegend.top(TextDirection textDirection) =>
      new ImageTestLegend(charts.BuildablePosition.top, textDirection);

  factory ImageTestLegend.bottom(TextDirection textDirection) =>
      new ImageTestLegend(charts.BuildablePosition.bottom, textDirection);

  factory ImageTestLegend.start(TextDirection textDirection) =>
      new ImageTestLegend(charts.BuildablePosition.start, textDirection);

  factory ImageTestLegend.end(TextDirection textDirection) =>
      new ImageTestLegend(charts.BuildablePosition.end, textDirection);

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: textDirection,
        child: new charts.BarChart(
          seriesList,
          animate: false,
          barGroupingType: charts.BarGroupingType.grouped,
          // Add the series legend behavior to the chart to turn on series legends.
          // By default the legend will display above the chart.
          behaviors: [new charts.SeriesLegend(position: position)],
        ));
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tabletSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    final otherSalesData = [
      new OrdinalSales('2014', 20),
      new OrdinalSales('2015', 35),
      new OrdinalSales('2016', 15),
      new OrdinalSales('2017', 10),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Other',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: otherSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
