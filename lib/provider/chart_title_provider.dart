import 'package:flutter/cupertino.dart';

import '../model/chart.dart';
import '../model/chart_title.dart';

class ChartTitleProvider extends ChangeNotifier {
  final List<ChartTitle> _chartTitles = [];

  List<ChartTitle> get chartTitles => _chartTitles;

  List<ChartTitle> get chartsOfSelectedDate => _chartTitles;

  void addChartTitle(ChartTitle chartTitle) {
    _chartTitles.add(chartTitle);

    notifyListeners();
  }
}
