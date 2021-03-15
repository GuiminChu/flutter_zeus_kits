import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZKTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final Color titleColor;
  final Color color;
  final double? cornerRadius;
  final bool enabled;
  final VoidCallback? onPressed;

  const ZKTextButton({
    Key? key,
    required this.width,
    this.height: 44.0,
    required this.title,
    this.fontSize: 16.0,
    this.titleColor: Colors.white,
    this.color: Colors.lightBlue,
    this.cornerRadius,
    this.enabled: true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultCornerRadius = 0.0;
    if (cornerRadius == null) {
      if (height == null) {
        defaultCornerRadius = 0.0;
      } else {
        defaultCornerRadius = height / 2;
      }
    } else {
      defaultCornerRadius = cornerRadius!;
    }

    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
        ),
        color: color,
        disabledColor: Colors.grey,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: titleColor,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCornerRadius),
        ),
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}

class ZKFilledButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double? cornerRadius;
  final bool enabled;
  final Widget child;
  final VoidCallback? onPressed;

  const ZKFilledButton({
    Key? key,
    required this.width,
    this.height: 44.0,
    this.color: Colors.lightBlue,
    this.cornerRadius,
    this.enabled: true,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultCornerRadius = 0.0;
    if (cornerRadius == null) {
      if (height == null) {
        defaultCornerRadius = 0.0;
      } else {
        defaultCornerRadius = height / 2;
      }
    } else {
      defaultCornerRadius = cornerRadius!;
    }

    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
        ),
        color: color,
        disabledColor: Colors.grey,
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCornerRadius),
        ),
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}

class ZKBorderButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final Color borderColor;
  final double? borderRadius;
  final double borderWidth;
  final Widget child;
  final VoidCallback? onPressed;

  const ZKBorderButton({
    Key? key,
    required this.width,
    required this.height,
    this.margin = EdgeInsets.zero,
    this.borderColor: const Color(0xFFF6AB00),
    this.borderWidth: 1.0,
    this.borderRadius,
    required this.child,
    this.onPressed,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultBorderRadius = 0.0;
    if (borderRadius == null) {
      if (height == null) {
        defaultBorderRadius = 0.0;
      } else {
        defaultBorderRadius = height / 2;
      }
    } else {
      defaultBorderRadius = borderRadius!;
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
        ),
        child: child,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class ZKGradientButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double? fontSize;
  final Color fontColor;
  final double borderRadius;
  final Gradient gradient;
  final VoidCallback? onPressed;

  const ZKGradientButton({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    this.fontSize,
    this.fontColor: Colors.white,
    this.gradient: const LinearGradient(
      colors: [
        Color(0xFF549CF4),
        Color(0xFF1085E7),
      ],
    ),
    this.borderRadius: 5.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
