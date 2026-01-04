import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class CreateOrderStepperWidget extends StatefulWidget {
  const CreateOrderStepperWidget({
    super.key,
    required this.currentStep,
    this.height = 84,
  });

  final int currentStep;
  final double height;

  @override
  State<CreateOrderStepperWidget> createState() => _CreateOrderStepperWidgetState();
}

class _CreateOrderStepperWidgetState extends State<CreateOrderStepperWidget> {
  List<String> defaultStatus = [
    LocaleKeys.orderDetails.tr(),
    LocaleKeys.deliveriesList.tr(),
    LocaleKeys.payment.tr(),
  ];
  final Color achievedColor = const Color(0xFF048372);
  final unachievedColor = const Color(0xffE6E6E6);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = widget.currentStep;
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      height: widget.height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Titles Row
          Row(
            children: List.generate(
              defaultStatus.length,
              (index) {
                bool isCurrent = index == currentStep;
                return Expanded(
                  child: Text(
                    defaultStatus[index],
                    style:
                        isCurrent
                            ? context.textTheme.bodySmall
                            : context.textTheme.labelSmall!.copyWith(
                              fontSize: 12.sp,
                            ),
                    textAlign:
                        index == 0
                            ? TextAlign.start
                            : index == defaultStatus.length - 1
                            ? TextAlign.end
                            : TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 8.h),

          // Icons and Lines Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              defaultStatus.length * 2 - 1,
              (index) {
                if (index.isEven) {
                  // Step icon
                  int stepIndex = index ~/ 2;
                  bool isCompleted = stepIndex < currentStep;
                  bool isCurrent = stepIndex == currentStep;

                  return Container(
                    width: isCurrent ? 28.w : 18.w,
                    height: isCurrent ? 28.w : 18.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted || isCurrent ? achievedColor : Colors.transparent,
                      border:
                          !(isCompleted || isCurrent)
                              ? Border.all(color: Colors.grey.shade300, width: 2)
                              : null,
                    ),
                    child:
                        isCompleted
                            ? Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12.sp,
                              weight: 900,
                            )
                            : isCurrent
                            ? Padding(
                              padding: EdgeInsets.all(6.w),
                              child: const CustomSvgBuilder(
                                path: Assets.svgsLoadingIc,
                              ),
                            )
                            : null,
                  );
                } else {
                  // Line between icons
                  int leftStep = index ~/ 2;
                  bool isCompleted = leftStep < currentStep;
                  bool isActiveLine = leftStep == currentStep;

                  return Expanded(
                    child: Container(
                      height: 3.h,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: (isActiveLine || isCompleted) ? achievedColor : unachievedColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
