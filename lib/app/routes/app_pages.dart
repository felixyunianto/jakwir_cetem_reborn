import 'package:get/get.dart';

import '../modules/akte_kelahiran/bindings/akte_kelahiran_binding.dart';
import '../modules/akte_kelahiran/views/akte_kelahiran_view.dart';
import '../modules/akte_kematian/bindings/akte_kematian_binding.dart';
import '../modules/akte_kematian/views/akte_kematian_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/form_kia/bindings/form_kia_binding.dart';
import '../modules/form_kia/views/form_kia_view.dart';
import '../modules/form_pindah/bindings/form_pindah_binding.dart';
import '../modules/form_pindah/views/form_pindah_view.dart';
import '../modules/form_report/bindings/form_report_binding.dart';
import '../modules/form_report/views/form_report_view.dart';
import '../modules/form_report_kelahiran/bindings/form_report_kelahiran_binding.dart';
import '../modules/form_report_kelahiran/views/form_report_kelahiran_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kia/bindings/kia_binding.dart';
import '../modules/kia/views/kia_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/perpindahan_keluar/bindings/perpindahan_keluar_binding.dart';
import '../modules/perpindahan_keluar/views/perpindahan_keluar_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/regulation/bindings/regulation_binding.dart';
import '../modules/regulation/views/regulation_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/usage_guide/bindings/usage_guide_binding.dart';
import '../modules/usage_guide/views/usage_guide_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.LAYOUT;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGULATION,
      page: () => const RegulationView(),
      binding: RegulationBinding(),
    ),
    GetPage(
      name: _Paths.USAGE_GUIDE,
      page: () => const UsageGuideView(),
      binding: UsageGuideBinding(),
    ),
    GetPage(
      name: _Paths.AKTE_KELAHIRAN,
      page: () => const AkteKelahiranView(),
      binding: AkteKelahiranBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.AKTE_KEMATIAN,
      page: () => const AkteKematianView(),
      binding: AkteKematianBinding(),
    ),
    GetPage(
      name: _Paths.FORM_REPORT,
      page: () => const FormReportView(),
      binding: FormReportBinding(),
    ),
    GetPage(
      name: _Paths.FORM_REPORT_KELAHIRAN,
      page: () => const FormReportKelahiranView(),
      binding: FormReportKelahiranBinding(),
    ),
    GetPage(
      name: _Paths.KIA,
      page: () => const KiaView(),
      binding: KiaBinding(),
    ),
    GetPage(
      name: _Paths.FORM_KIA,
      page: () => const FormKiaView(),
      binding: FormKiaBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PINDAH,
      page: () => const FormPindahView(),
      binding: FormPindahBinding(),
    ),
    GetPage(
      name: _Paths.PERPINDAHAN_KELUAR,
      page: () => const PerpindahanKeluarView(),
      binding: PerpindahanKeluarBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
