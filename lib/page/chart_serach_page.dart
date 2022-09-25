import 'package:flutter/material.dart';

import '../util/util.dart';

class ChartSearchPage extends StatefulWidget {
  @override
  _ChartSearchPageState createState() => _ChartSearchPageState();
}

class _ChartSearchPageState extends State<ChartSearchPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime formDate;

  @override
  void initState() {
    super.initState();

    formDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: buildSearchingAction(), leading: CloseButton()),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              buildText(),
              SizedBox(
                height: 24,
              ),
              buildDateTimePicker()
            ]),
          ),
        ));
  }

  List<Widget> buildSearchingAction() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          icon: Icon(Icons.done),
          label: Text('検索'),
          onPressed: () {},
        )
      ];

  //タイトル入力フォーム
  Widget buildText() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Add Title'),
        validator: (title) =>
            title != null && title.isEmpty ? 'タイトルが入力されていません' : null,
        controller: titleController,
      );

  Widget buildDateTimePicker() => Column(
        children: [buildDate()],
      );
  Widget buildDate() => buildHeader(
        header: '年月日',
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: buildDropdownField(
                    text: Utils.toDate(formDate),
                    onClicked: () => pickFromDateTime(pickDate: true))),
          ],
        ),
      );

  Widget buildHeader({required String header, required Widget child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

  buildDropdownField({required String text, required VoidCallback onClicked}) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(formDate, pickDate: pickDate);
    if (date == null) return;
    print(formDate);
    print(date);
    setState(() => formDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(formDate,
        pickDate: pickDate, firstDate: pickDate ? formDate : null);
    if (date == null) return;
    setState(() => formDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    print(pickDate);
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2101));

      if (date == null) {
        return null;
      }
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
      if (TimeOfDay == null) {
        return null;
      }
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay!.hour, minutes: timeOfDay.minute);
    }
  }
}
