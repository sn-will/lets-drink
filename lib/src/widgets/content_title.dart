import 'package:flutter/material.dart';

class ContentTitle extends StatelessWidget {
  final _contentSpacing = 20.0;
  final String title;
  final double titleSize;
  final Color titleColor;
  final FontWeight titleWeight;
  final double subtitleSize;
  final String subtitle;

  ContentTitle({
    @required this.title,
    this.titleColor,
    this.titleWeight,
    this.subtitleSize,
    this.subtitle = '',
    @required this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasSubtitle = subtitle.length > 0;

    return Container(
      padding: EdgeInsets.only(
        top: (_contentSpacing / 2),
        bottom: (_contentSpacing / 2),
        left: _contentSpacing,
        right: _contentSpacing,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: titleWeight ?? FontWeight.w600,
              color: titleColor,
            ),
          ),
          hasSubtitle ? SizedBox(height: 5) : Container(),
          hasSubtitle
              ? Text(
                  subtitle,
                  style: TextStyle(fontSize: subtitleSize),
                )
              : Container(),
        ],
      ),
    );
  }
}
