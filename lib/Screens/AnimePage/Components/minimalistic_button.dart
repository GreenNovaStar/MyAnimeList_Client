import 'package:flutter/material.dart';

class MinimalisticButton extends StatelessWidget {
  Function onTap;
  Widget child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  BorderRadiusGeometry? borderRadius;
  Color? backgroundColor;
  MinimalisticButton(
      {Key? key,
      required this.onTap,
      required this.child,
      this.padding,
      this.margin,
      this.borderRadius,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: child,
        padding: padding ?? const EdgeInsets.all(4),
        margin: margin ?? const EdgeInsets.only(left: 8, top: 20, right: 8),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
