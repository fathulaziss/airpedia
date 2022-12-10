import 'package:airpedia/app/modules/destination/components/destination_header_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationHeader extends StatelessWidget {
  const DestinationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxHeight < 350.w
            ? const DestinationHeaderOne()
            : const DestinationHeaderOne();
      },
    );
  }
}
