import 'package:flutter/material.dart';
import 'package:web_vue/page/event_editing_page.dart';

import '../model/event.dart';

class EventDefalutPage extends StatelessWidget {
  final Event? event;

  const EventDefalutPage({super.key, this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildDefalutActions(context, event!),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(event!.title,
                  style: TextStyle(color: Colors.black, fontSize: 24))
            ],
          )),
    );
  }
}

List<Widget> buildDefalutActions(BuildContext context, Event event) {
  return [
    IconButton(
        onPressed: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => EventEditingPage(
                      event: event,
                    ))),
        icon: Icon(Icons.edit))
  ];
}
