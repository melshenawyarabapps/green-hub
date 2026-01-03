import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onChanged,
  });

  final bool isSelected;
  final String label;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(),
      child: Row(
        spacing: 8,
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? context.theme.primaryColor : Colors.grey,
                width: 1.w,
              ),
            ),
            child:
                isSelected
                    ? Center(
                      child: CircleAvatar(
                        radius: 7.r,
                        backgroundColor: context.theme.primaryColor,
                      ),
                    )
                    : null,
          ),
          Text(
            label,
            style: context.textTheme.displayMedium!.copyWith(
              color: isSelected ? context.theme.primaryColor : null,
              fontWeight: isSelected ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
