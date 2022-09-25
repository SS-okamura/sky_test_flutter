import 'package:flutter/cupertino.dart';

import '../model/chart.dart';

class ChartProvider extends ChangeNotifier {
  final List<Chart> _charts = [];

  List<Chart> get charts => _charts;

  List<Chart> get chartsOfSelectedDate => _charts;

  void addChart(Chart chart) {
    _charts.add(chart);

    notifyListeners();
  }
}
