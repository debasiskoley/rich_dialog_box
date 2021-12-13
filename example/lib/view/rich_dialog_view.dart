import 'package:flutter/material.dart';
import 'package:rich_dialog_box/rich_dialog_box.dart';

class RichDialogView extends StatefulWidget {

  const RichDialogView({Key key, this.title}) : super(key:key);
  final String title;

  @override
  _RichDialogViewState createState() => _RichDialogViewState();
}

class _RichDialogViewState extends State<RichDialogView> {
  TextEditingController _textController;


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textController?.dispose();
  }

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
        MaterialButton(
          onPressed:()=> _buildSimpleAlertBox(),
          child: Text('Simple Dialog box'),
        ),
        MaterialButton(
          onPressed:()=> _buildAlertWithCornerCrossButton(),
          child: Text('Dialog box with close IconButton at Corner'),
        ),
        MaterialButton(
          onPressed:()=> _buildMultiActionAlertBox(),
          child: Text('Multi Action Dialog box'),
        ),
        MaterialButton(
          onPressed:()=> _buildAlertWithTextField(),
          child: Text('Dialog box With TextField'),
        )
      ],
    );
  }


  void _buildSimpleAlertBox() {
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
                'Simple Dialog with one button.',
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

  void _buildAlertWithCornerCrossButton() {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return RichDialogBox(
          title: 'Rich Dialog',
          titleSize: 20,
          titlePadding: const EdgeInsets.all(20.0),
          content: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Simple Dialog with top cancel button',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          isClose: true,
        );
      },
    );
  }

  void _buildMultiActionAlertBox() {
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
              isPositive: true,
              onPressed: () {
                print('pressed');
                Navigator.pop(context);
              },
            ),
            ActionButton(
              buttonText: 'Cancel',
              isPositive: false,
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


  void _buildAlertWithTextField() {
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
                'Two button with input option.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          form: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
                controller: _textController,
                 decoration: InputDecoration(
                   labelText: 'Text Field'
                 ),
              ),
          ),
          actions: <ActionButton>[
            ActionButton(
              buttonText: 'Submit',
              onPressed: () {
                print('pressed');
                _textController?.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}
