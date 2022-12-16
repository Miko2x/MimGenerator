import 'package:get/get.dart';
import 'package:mim_generator/app/data/models/mim_model.dart';
import 'package:mim_generator/app/modules/mim_generator_module/repositories/mim_repository.dart';
import 'package:mim_generator/routes/app_pages.dart';

class MimListController extends GetxController  {
  MimRepository mimRepository = MimRepository();

  /// List dari mim
  final _mimList = <Meme>[].obs;
  List<Meme> get mimList => _mimList;
  set setMimList(List<Meme> value) => _mimList.value = value;
  
  /// Ketika memilih salah satu dari list mim maka akan masuk kedalam
  /// meme model ini.
  final _memeModel = Meme().obs;
  Meme get meme => _memeModel.value;
  set setMeme(Meme value) => _memeModel.value = value;
  
  /// Get list mim dari api.imgflip.com
  Future<void> getList() async {
    try {
      MimModel mimModel = await mimRepository.getList();
      setMimList = mimModel.data.memes;
    } catch (e) {
      rethrow;
    }
  }

  /// Karena data yg di get tidak selalu berubah,
  /// maka refresh listnya kita randomize
  void refreshList() {
    mimList.shuffle();
  }

  /// Set meme dan navigate kedalam detail meme
  void details(Meme detail) {
    setMeme = detail;
    Get.toNamed(RoutePaths.mimDetail);
  }
}