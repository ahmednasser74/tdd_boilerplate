import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalListBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double heightList;

  const HorizontalListBuilder({
    required this.itemBuilder,
    required this.itemCount,
    this.heightList = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (heightList / 100).sh,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
