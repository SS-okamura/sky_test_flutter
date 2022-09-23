import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:web_vue/constants.dart';
import 'package:web_vue/responsive/desktop_scaffold.dart';

class SchedukeAdd extends StatefulWidget {
  const SchedukeAdd({Key? key}) : super(key: key);

  @override
  State<SchedukeAdd> createState() => _SchedukeAddState();
}

class _SchedukeAddState extends State<SchedukeAdd> {
  var _fromDatetime = DateTime.now();
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');
  DateTime _toDatetime = DateTime.now();

  Future _openStartTime(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await DatePicker.showDateTimePicker(context,
        showTitleActions: true, onConfirm: (date) {
      setState(() {
        _fromDatetime = date;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.jp);
    // （6） 選択された場合に、値を設定する
    if (_date != null) {
      setState(() {
        _fromDatetime = _date;
      });
      print(_fromDatetime);
    }
  }

  Future _openEndTime(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await DatePicker.showDateTimePicker(context,
        showTitleActions: true, onConfirm: (date) {
      print(_toDatetime);
      _toDatetime = date;
      print(_toDatetime);
      setState(() {});
    }, currentTime: DateTime.now(), locale: LocaleType.jp);
    // （6） 選択された場合に、値を設定する
    print(_date);
    if (_date != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'タイトルを入力',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  _openStartTime(context);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      '開始日時: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      formatter.format(_fromDatetime),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    '終了日時: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _openEndTime(context);
                    },
                    child: Text(
                      // フォーマッターを使用して指定したフォーマットで日時を表示
                      // format()に渡すのはDate型の値で、String型で返される
                      formatter.format(_toDatetime),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('検索')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
