import 'package:get/get.dart';
import 'package:mim_generator/app/modules/mim_generator_module/controllers/mim_detail_controller.dart';
import 'package:mim_generator/app/modules/mim_generator_module/controllers/mim_list_controller.dart';

class MimListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MimListController>(() => MimListController());
  }
}

class MimDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MimDetailController>(() => MimDetailController());
  }
}
