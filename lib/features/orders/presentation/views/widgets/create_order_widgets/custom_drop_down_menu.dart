import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownWidget<T> extends StatefulWidget {
  const CustomDropdownWidget({
    super.key,
    required this.items,
    required this.hint,
    this.onChanged,
    this.selectedValue,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.height,
    this.borderRadius,
    this.elevation,
    this.contentPadding,
    required this.itemLabelBuilder,
  });

  final List<T> items;
  final String hint;
  final ValueChanged<T?>? onChanged;
  final T? selectedValue;

  /// Converts item to display text
  final String Function(T item) itemLabelBuilder;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  final double? height;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CustomDropdownWidget<T>> createState() =>
      _CustomDropdownWidgetState<T>();
}

class _CustomDropdownWidgetState<T>
    extends State<CustomDropdownWidget<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 48.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 160.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: _selectedValue,
          hint: Text(
            widget.hint,
            style: TextStyle(
              color: widget.hintColor ?? const Color(0xFF9E9E9E),
              fontSize: 14.sp,
            ),
          ),
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: widget.iconColor ?? const Color(0xFF9E9E9E),
            size: 24.sp,
          ),
          dropdownColor:
          widget.backgroundColor ?? const Color(0xFFF5F5F5),
          borderRadius:
          BorderRadius.circular(widget.borderRadius ?? 8.r),
          elevation: widget.elevation?.toInt() ?? 2,
          style: TextStyle(
            color: widget.textColor ?? Colors.black87,
            fontSize: 14.sp,
          ),
          padding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          items: widget.items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                widget.itemLabelBuilder(item),
                style: TextStyle(
                  color: widget.textColor ?? Colors.black87,
                  fontSize: 14.sp,
                ),
              ),
            );
          }).toList(),
          onChanged: (T? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            widget.onChanged?.call(newValue);
          },
        ),
      ),
    );
  }
}
