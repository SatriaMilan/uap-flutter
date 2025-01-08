import 'package:get/get.dart';

import '../modules/akstivitas/bindings/akstivitas_binding.dart';
import '../modules/akstivitas/views/akstivitas_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keranjang/bindings/keranjang_binding.dart';
import '../modules/keranjang/views/keranjang_view.dart';
import '../modules/natal/bindings/natal_binding.dart';
import '../modules/natal/views/natal_view.dart';
import '../modules/newyear/bindings/newyear_binding.dart';
import '../modules/newyear/views/newyear_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/promo/bindings/promo_binding.dart';
import '../modules/promo/views/promo_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROMO,
      page: () => const PromoView(),
      binding: PromoBinding(),
    ),
    GetPage(
      name: _Paths.AKSTIVITAS,
      page: () => const AktivitasView(),
      binding: AkstivitasBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NATAL,
      page: () => const NatalView(),
      binding: NatalBinding(),
    ),
    GetPage(
      name: _Paths.NEWYEAR,
      page: () => const NewyearView(),
      binding: NewyearBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => const KeranjangView(),
      binding: KeranjangBinding(),
    ),
  ];
}