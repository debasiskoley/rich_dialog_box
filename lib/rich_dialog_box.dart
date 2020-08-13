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
    this.form,
    @required this.content,
    this.padding,
    this.borderRadius,
    this.isClose = false,
    this.onPressClose,
    this.shape,
    this.elevation,
    this.backGroundColor = Colors.white,
    this.actions

  }) : super(key: key);

  final String title;
  final double titleSize;
  final String titleFamily;
  final Color titleColor;
  final Widget form;
  final Widget content;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final bool isClose;
  final Function onPressClose;
  final ShapeBorder shape;
  final double elevation;
  final Color backGroundColor;
  final List<ActionButton> actions;

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
                widget.content ?? const SizedBox(height: 0),
                SizedBox(height: 10),
                widget.form ?? const SizedBox(height: 0),
                SizedBox(height: 10),
                _buildActionsWidget(),
              ],
            ),
            widget.isClose
                ? Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () =>  widget.onPressClose != null ? widget.onPressClose() : Navigator.pop(context),
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

  Widget _buildActionsWidget(){
    return  ( widget.actions != null
        && widget.actions.length == 2
        && widget.actions[0].isPositive !=null
        && widget.actions[1].isPositive !=null)
        ? Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ( widget.actions[0].isPositive && !widget.actions[1].isPositive)
                ? widget.actions[0] : const SizedBox(height: 10),

                (widget.actions[0].isPositive && !widget.actions[1].isPositive)
                ? widget.actions[1] : const SizedBox(height: 10),
              ]
          )
        : ( widget.actions != null && widget.actions.length == 1  && widget.actions[0].isPositive == null)
        ? Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.actions[0]
              ]
          )
        : const SizedBox(height: 10);
  }

}


class ActionButton extends StatelessWidget {

  const ActionButton({
    Key key,
    @required
    this.buttonText,
    @required
    this.onPressed,
    this.isPositive,
    this.padding = const EdgeInsets.symmetric(vertical: 20.0),
    this.buttonColor = Colors.white,
    this.buttonTextStyle = const TextStyle (color: Colors.black, fontSize: 15.0),
  }) : super(key: key);

  final bool isPositive;
  final Color buttonColor;
  final EdgeInsets padding;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RaisedButton(
        color: Colors.white,
        padding: padding,
        shape: isPositive == null
            ? RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        )
            : isPositive
            ? RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
          ),
        )
            : RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
          ),
        ) ,
        onPressed:() => onPressed(),
        child:  Text(
          '$buttonText',
          style: buttonTextStyle,
        ),
      ),
    );
  }
}