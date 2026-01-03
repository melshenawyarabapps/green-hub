import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/features/addresses/data/repos/address_repository.dart';
import 'package:greenhub/features/addresses/presentation/cubit/address_cubit.dart';
import 'package:greenhub/features/addresses/presentation/cubit/address_state.dart';
import 'widgets/address_item_widget.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(AddressRepository())..fetchAddresses(),
      child: const _AddressesViewBody(),
    );
  }
}

class _AddressesViewBody extends StatelessWidget {
  const _AddressesViewBody();

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
      title: LocaleKeys.selectYourAddress.tr(),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state.status == AddressStatus.loading && state.addresses.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == AddressStatus.failure) {
            return Center(child: Text(state.errorMessage ?? 'Error loading addresses'));
          }
          return ListView.separated(
            padding: AppPadding.verticalPadding(20.h),
            itemBuilder: (_, index) {
              if (index == state.addresses.length) {
                return ElevatedButton(
                  onPressed: () {
                    context.pushNamed(
                      AppRoutes.addAddressView,
                      arguments: {
                        'addressCubit': context.read<AddressCubit>(),
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.addNewAddress.tr()),
                      10.horizontalSpace,
                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: context.theme.secondaryHeaderColor,
                        child: Icon(
                          Icons.add,
                          size: 12.r,
                          color: context.theme.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                );
              }
              final address = state.addresses[index];
              return AddressItemWidget(
                model: address,
                onEdit: () {
                  context.pushNamed(
                    AppRoutes.editAddressView,
                    arguments: {
                      'addressCubit': context.read<AddressCubit>(),
                      'addressModel': address,
                    },
                  );
                },
                onDelete: () {
                  context.read<AddressCubit>().deleteAddress(address.id);
                },
              );
            },
            separatorBuilder: (_, __) => 12.verticalSpace,
            itemCount: state.addresses.length + 1,
          );
        },
      ),
    );
  }
}
