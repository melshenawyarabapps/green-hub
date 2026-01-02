import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/addresses/data/models/address_model.dart';

import '../../../../../generated/assets.dart';

class AddressItemWidget extends StatelessWidget {
  const AddressItemWidget({
    super.key,
    required this.model,
    this.hasDelete = false,
    this.onEdit,
    this.onDelete,
  });

  final AddressModel model;
  final bool hasDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 12.w,
        vertical: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        spacing: 12.w,
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppLightColors.greyColor2,
            ),
            child: const CustomSvgBuilder(
              path: Assets.svgsAddressHomeIc,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.addressName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppLightColors.black87Color,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 22.w,
                      width: 22.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: CustomSvgBuilder(
                        path: Assets.svgsLocation,
                        color: context.theme.primaryColor,
                      ),
                    ),
                    4.horizontalSpace,
                    Expanded(
                      child: Text(
                        '${model.streetName}، ${model.cityName}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppLightColors.black54Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: hasDelete ? onDelete : onEdit,
            child: Container(
              width: 32.w,
              height: 32.w,
              padding: EdgeInsets.all(9.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasDelete ? const Color(0xffFFF0F0) : AppLightColors.greyColor2,
              ),
              child: CustomSvgBuilder(
                path: hasDelete ? Assets.svgsDeleteIc : Assets.svgsEditIc,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
