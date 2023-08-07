
import 'package:flutter/material.dart';

class CommonIcon extends StatefulWidget {
  const CommonIcon({Key? key, this.onpress, this.icon, this.color}) : super(key: key);

  final onpress;
  final color;
  final icon;

  @override
  State<CommonIcon> createState() => _CommonIconState();
}

class _CommonIconState extends State<CommonIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:
      widget.onpress,
        icon:Icon(widget.icon,color: widget.color,size: 22,));
  }
}
