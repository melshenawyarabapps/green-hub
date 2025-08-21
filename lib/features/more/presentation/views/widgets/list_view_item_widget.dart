import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/models/more_model.dart';

class ListViewItemWidget extends StatelessWidget {
  const ListViewItemWidget({super.key, required this.model});
final MoreModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.onPressed,
      child: Row(
        children: [
          Image.asset(model.icon,width: 20.w,),
          8.horizontalSpace,
          Text(model.title,style: Theme.of(context).textTheme.bodyLarge,),
        ],
      ),
    );
  }
}
