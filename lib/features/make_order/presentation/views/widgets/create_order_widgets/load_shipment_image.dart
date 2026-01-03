import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';
import 'package:image_picker/image_picker.dart';

class LoadShipmentImage extends StatefulWidget {
  const LoadShipmentImage({super.key, this.onImageSelected});

  final void Function(File? image)? onImageSelected;

  @override
  State<LoadShipmentImage> createState() => _LoadShipmentImageState();
}

class _LoadShipmentImageState extends State<LoadShipmentImage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected?.call(_selectedImage);
    }
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null;
    });
    widget.onImageSelected?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.uploadShipmentImages.tr(),
          style: context.textTheme.headlineSmall,
        ),
        16.verticalSpace,
        GestureDetector(
          onTap: _selectedImage == null ? _pickImageFromGallery : null,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: AppLightColors.greyColor2,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppLightColors.greyColor5,
                width: 1,
              ),
            ),
            child: _selectedImage != null ? _imageWidget(context) : _defaultWidget(context),
          ),
        ),
      ],
    );
  }

  Widget _imageWidget(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            _selectedImage!,
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: _clearImage,
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 16.r,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _defaultWidget(BuildContext context) {
    return Column(
      children: [
        const CustomSvgBuilder(
          path: Assets.svgsDocumentUpload,
        ),
        12.verticalSpace,
        Text(
          LocaleKeys.uploadTheImageHere.tr(),
          style: context.primaryTextTheme.titleMedium,
        ),
        8.verticalSpace,
        Text(
          '${LocaleKeys.availableFormats.tr()} : JPEG, PNG, PDF, Word, PPT',
          style: context.textTheme.labelSmall,
        ),
      ],
    );
  }
}
