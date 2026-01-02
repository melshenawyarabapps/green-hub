import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/features/addresses/data/models/address_model.dart';
import 'package:greenhub/features/addresses/presentation/cubit/address_cubit.dart';
import 'package:greenhub/features/addresses/presentation/views/addresses_view.dart';
import 'package:greenhub/features/addresses/presentation/views/edit_address_view.dart';
import 'package:greenhub/features/auth/presentation/views/auth_view.dart';
import 'package:greenhub/features/auth/presentation/views/before_register_view.dart';
import 'package:greenhub/features/auth/presentation/views/face_id_view.dart';
import 'package:greenhub/features/auth/presentation/views/login_view.dart';
import 'package:greenhub/features/auth/presentation/views/register_view.dart';
import 'package:greenhub/features/auth/presentation/views/verification_view.dart';
import 'package:greenhub/features/before_auth/presentation/views/before_auth_view.dart';
import 'package:greenhub/features/boarding/presentation/cubit/boarding_cubit.dart';
import 'package:greenhub/features/boarding/presentation/views/boarding_view.dart';
import 'package:greenhub/features/make_order/presentation/views/available_vehicles_view.dart';
import 'package:greenhub/features/navigation/presentation/views/navigation_view.dart';
import 'package:greenhub/features/more/presentation/views/more_view.dart';
import 'package:greenhub/features/notifications/presentation/views/notification_view.dart';
import 'package:greenhub/features/splash/presentation/views/splash_view.dart';

import '../services/di/di.dart';

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.onBoardingView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt.get<BoardingCubit>(),
                child: const BoardingView(),
              ),
        );
      case AppRoutes.beforeAuthView:
        return MaterialPageRoute(builder: (_) => const BeforeAuthView());
      case AppRoutes.authView:
        return MaterialPageRoute(builder: (_) => const AuthView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case AppRoutes.verificationView:
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case AppRoutes.navigationView:
        return MaterialPageRoute(builder: (_) => const NavigationView());
      case AppRoutes.moreView:
        return MaterialPageRoute(builder: (_) => const MoreView());
      case AppRoutes.beforeRegisterView:
        return MaterialPageRoute(builder: (_) => const BeforeRegisterView());
      case AppRoutes.faceIdView:
        return MaterialPageRoute(builder: (_) => const FaceIdView());
      case AppRoutes.notificationsView:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case AppRoutes.availableVehiclesView:
        return MaterialPageRoute(builder: (_) => const AvailableVehiclesView());
      case AppRoutes.addressesView:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (_) => getIt.get<AddressCubit>()..fetchAddresses(),
            child: const AddressesView()));
      case AppRoutes.editAddressView:
        return MaterialPageRoute(
          builder:
              (_) => const EditAddressView(
                model: AddressModel(
                  id: 0,
                  addressName: 'منزلي',
                  governorateName: ' الرياض',
                  cityName: ' الرياض',
                  districtName: ' الرياض',
                  streetName: 'ش الايمان ',
                  buildingNumber: '5',
                  floorNumber: '4',
                  landMark: 'بجانب مسجد الهدى',
                ),
              ),
        );
      default:
        return null;
    }
  }
}
