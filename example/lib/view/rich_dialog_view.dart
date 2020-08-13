import 'package:flutter/material.dart';
import 'package:rich_dialog_box/rich_dialog_box.dart';

class RichDialogView extends StatefulWidget {

  const RichDialogView({Key key, this.title}) : super(key:key);
  final String title;

  @override
  _RichDialogViewState createState() => _RichDialogViewState();
}

class _RichDialogViewState extends State<RichDialogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: _showContent(),
    );
  }


  Widget _showContent(){
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        RaisedButton(
          onPressed:()=> _showSimpleAlertBox(),
          child: Text('Simple Dialog box'),
        )
      ],
    );
  }


  void _showSimpleAlertBox() {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return RichDialogBox(
          title: 'Rich Dialog',
          titleSize: 20,
          titlePadding: const EdgeInsets.all(10.0),
          content: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Two button with description.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          actions: <ActionButton>[
            ActionButton(
              buttonText: 'OK',
              onPressed: () {
                print('pressed');
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
