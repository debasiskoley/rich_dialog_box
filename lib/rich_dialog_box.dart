library rich_dialog_box;
import 'package:flutter/material.dart';

class RichDialogBox extends StatefulWidget {
  const RichDialogBox({
    Key key,
    @required this.title,
    this.titleSize = 20,
    this.titleFamily = '',
    this.titleColor = Colors.black,
    this.titlePadding = const EdgeInsets.all(20),
    this.isForm = false,
    this.form = const Text('Form field is not present.'),
    @required this.content,
    this.padding,
    this.borderRadius,
    @required this.actions,
    this.isClose = false,
    this.onPressClose,
    this.shape,
    this.elevation,
    this.backGroundColor = Colors.white,
  }) : super(key: key);

  final String title;
  final double titleSize;
  final String titleFamily;
  final Color titleColor;
  final bool isForm;
  final Widget form;
  final Widget content;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final List<Widget> actions;
  final bool isClose;
  final Function onPressClose;
  final ShapeBorder shape;
  final double elevation;
  final Color backGroundColor;

  @override
  _RichDialogBoxState createState() => _RichDialogBoxState();
}

class _RichDialogBoxState extends State<RichDialogBox> {
  @override
  Widget build(BuildContext context) {
    final Widget dialogChild = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: widget.titlePadding ??
                      EdgeInsets.fromLTRB(10.0, 10.0, 10.0,
                          widget.content == null ? 10.0 : 0.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.titleColor,
                      fontFamily: 'RobotoRegular',
                      fontSize: widget.titleSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                widget.isForm
                    ? widget.form
                    : const SizedBox(height: 0),
                widget.content ??
                    const SizedBox(height: 0),
                (widget.actions != null)
                    ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.actions)
                    : const SizedBox(height: 10),
              ],
            ),
            widget.isClose
                ? Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () =>
                widget.onPressClose ?? Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  size: 25,
                ),
              ),
            )
                : const SizedBox(height: 0)
          ],
        ),
      ],
    );

    return Dialog(
      backgroundColor: widget.backGroundColor,
      elevation: widget.elevation,
      shape: widget.shape ??
          RoundedRectangleBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(20.0)),
      child: dialogChild,
    );
  }
}
