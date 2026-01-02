import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/features/addresses/data/models/address_model.dart';
import 'package:greenhub/features/addresses/presentation/cubit/address_cubit.dart';
import 'package:greenhub/features/addresses/presentation/cubit/address_state.dart';
import 'package:greenhub/features/addresses/presentation/views/widgets/address_item_widget.dart';

import '../../../../generated/assets.dart';

class EditAddressView extends StatefulWidget {
  const EditAddressView({super.key, this.model});

  final AddressModel? model;

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _searchController;
  late final TextEditingController _governorateController;
  late final TextEditingController _cityController;
  late final TextEditingController _districtController;
  late final TextEditingController _streetController;
  late final TextEditingController _buildingController;
  late final TextEditingController _floorController;
  late final TextEditingController _landmarkController;

  bool get _isEditMode => (widget.model != null);

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _governorateController = TextEditingController(text: widget.model?.governorateName ?? '');
    _cityController = TextEditingController(text: widget.model?.cityName ?? '');
    _districtController = TextEditingController(text: widget.model?.districtName ?? '');
    _streetController = TextEditingController(text: widget.model?.streetName ?? '');
    _buildingController = TextEditingController(text: widget.model?.buildingNumber ?? '');
    _floorController = TextEditingController(text: widget.model?.floorNumber ?? '');
    _landmarkController = TextEditingController(text: widget.model?.landMark ?? '');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _governorateController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final cubit = context.read<AddressCubit>();

    if (_isEditMode) {
      final updatedAddress = widget.model!.copyWith(
        governorateName: _governorateController.text,
        cityName: _cityController.text,
        districtName: _districtController.text,
        streetName: _streetController.text,
        buildingNumber: _buildingController.text,
        floorNumber: _floorController.text,
        landMark: _landmarkController.text,
      );
      cubit.editAddress(updatedAddress);
    } else {
      final newAddress = AddressModel(
        id: 0, // Will be assigned by repository
        addressName: _districtController.text,
        governorateName: _governorateController.text,
        cityName: _cityController.text,
        districtName: _districtController.text,
        streetName: _streetController.text,
        buildingNumber: _buildingController.text,
        floorNumber: _floorController.text,
        landMark: _landmarkController.text,
      );
      cubit.addAddress(newAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.status == AddressStatus.success) {
          Navigator.pop(context);
        } else if (state.status == AddressStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error saving address')),
          );
        }
      },
      child: DefaultPageLayout(
        title: _isEditMode ? LocaleKeys.editAddress.tr() : LocaleKeys.addNewAddress.tr(),
        bottomSheet: Padding(
          padding: AppPadding.all(20),
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              return AppElevatedButton(
                title: LocaleKeys.save.tr(),
                onPressed: state.status == AddressStatus.loading ? null : _saveAddress,
              );
            },
          ),
        ),
        child: Padding(
          padding: AppPadding.verticalPadding(12),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: AppPadding.hvPadding(
                vertical: 20,
              ),
              children: [
                if (_isEditMode)
                  AddressItemWidget(
                    model: widget.model!,
                    hasDelete: true,
                    onDelete: () {
                      context.read<AddressCubit>().deleteAddress(widget.model!.id);
                    },
                  ),
                if (_isEditMode) 12.verticalSpace,
                AppTextFormField(
                  controller: _searchController,
                  hintText: LocaleKeys.searchForAddress.tr(),
                  prefixIcon: Padding(
                    padding: AppPadding.onlyPadding(top: 20, bottom: 20, start: 12),
                    child: SvgPicture.asset(
                      Assets.svgsSearch,
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                ),
                12.verticalSpace,
                Row(
                  spacing: 8.w,
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: _governorateController,
                        hintText: LocaleKeys.governorateName.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.fieldRequired.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: AppTextFormField(
                        controller: _cityController,
                        hintText: LocaleKeys.cityName.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.fieldRequired.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Row(
                  spacing: 8.w,
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: _districtController,
                        hintText: LocaleKeys.districtName.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.fieldRequired.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: AppTextFormField(
                        controller: _streetController,
                        hintText: LocaleKeys.streetName.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.fieldRequired.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Row(
                  spacing: 8.w,
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: _buildingController,
                        hintText: LocaleKeys.buildingNumber.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.fieldRequired.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: AppTextFormField(
                        controller: _floorController,
                        hintText: LocaleKeys.floorNumber.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.fieldRequired.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                AppTextFormField(
                  controller: _landmarkController,
                  hintText: LocaleKeys.nearLandMark.tr(),
                  minLines: 3,
                  maxLines: 3,
                  radius: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
