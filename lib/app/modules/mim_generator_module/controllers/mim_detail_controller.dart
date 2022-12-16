import 'package:flutter/material.dart' hide Image;
import 'package:get/get.dart';
import 'package:mim_generator/app/data/models/mim_model.dart';
import 'package:mim_generator/app/modules/mim_generator_module/repositories/mim_repository.dart';

class MimDetailController extends GetxController  {
  MimRepository mimRepository = MimRepository();
  final Rx<TextEditingController> mimTextController = TextEditingController().obs;
  final Rx<FocusNode> focusNode = FocusNode().obs;
  final Rx<Color> color = Colors.black.obs;

  final RxList<ValueNotifier<Matrix4>> _matrix = List.filled(0, ValueNotifier(Matrix4.identity())).obs;
  RxList<ValueNotifier<Matrix4>> get matrix => _matrix;
  set setMatrix(List<ValueNotifier<Matrix4>> value) {
    _matrix.value = value;
  }

  /// is loading
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  set setIsLoading(bool value) => _isLoading.value = value;

  /// is share
  final RxBool _isShare = false.obs;
  RxBool get isShare => _isShare;
  set setIsShare(bool value) => _isShare.value = value;

  /// is editor mode
  final RxBool _isEdit = true.obs;
  RxBool get isEdit => _isEdit;
  set setIsEdit(bool value) => _isEdit.value = value;

  /// Decoration item
  final RxList<Widget> _items = <Widget>[].obs;
  List<Widget> get items => _items;
  set setItems(Widget item) {
    _items.add(item);
  }

  /// Size parent
  final Rx<Size> _size = const Size(0, 0).obs;
  Size get size => _size.value;
  set setSize(Size value) => _size.value = value;

  /// Detail meme
  final _memeModel = Meme().obs;
  Meme get meme => _memeModel.value;
  set setMeme(Meme value) => _memeModel.value = value;

  /// Hapus item yang baru ditambahkan
  void undo() {
    if (items.isNotEmpty) {
      matrix.removeLast();
      items.removeLast();
    }
  }
  
  /// Post mim ke imgbb
  Future<String?> postMim(String path) async {
    try {
      final url = await mimRepository.postMim(path);
      return url;
    } catch (e) {
      rethrow;
    }
  }
}