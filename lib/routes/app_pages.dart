import 'package:get/get.dart';
import 'package:mim_generator/app/modules/mim_generator_module/bindings.dart';
import 'package:mim_generator/app/modules/mim_generator_module/pages/mim_detail_view.dart';
import 'package:mim_generator/app/modules/mim_generator_module/pages/mim_list_view.dart';

part './route_paths.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RoutePaths.mimList,
      page: () => const MimListView(),
      binding: MimListBinding(),
    ),
    GetPage(
      name: RoutePaths.mimDetail,
      page: () => const MimDetailView(),
      binding: MimDetailBinding(),
    ),
  ];
}