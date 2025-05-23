import 'package:ToDoApp/core/helper/setSvg.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

Widget customCalenderContainer() {
  return Padding(
    padding: const EdgeInsets.only(left: 27, right: 17),
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          setSvgPicture(assetPath: AppAssets.calenderIcon),

          const SizedBox(width: 8.0),
          Text('30 June, 2022', style: TextStyle(fontSize: 16.0)),
          const SizedBox(width: 8.0),

          const SizedBox(width: 8.0),
          Text('10:00 pm', style: TextStyle(fontSize: 16.0)),
        ],
      ),
    ),
  );
}
