import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mim_generator/app/data/providers/api.dart';
import 'package:mim_generator/app/modules/mim_generator_module/controllers/mim_detail_controller.dart';
import 'package:mim_generator/app/modules/mim_generator_module/controllers/mim_list_controller.dart';
import 'package:mim_generator/app/modules/mim_generator_module/widgets/mim_drag_scale_widget.dart';
import 'package:mim_generator/app/modules/mim_generator_module/widgets/modal_add_text.dart';
import 'package:mim_generator/app/widgets/conditional_widget.dart';
import 'package:mim_generator/app/widgets/mim_app_bar.dart';
import 'package:mim_generator/app/widgets/mim_button.dart';
import 'package:mim_generator/app/widgets/mim_text.dart';
import 'package:mim_generator/core/utils/common_utils.dart';
import 'package:mim_generator/core/strings/sentences.dart';
import 'package:mim_generator/core/strings/words.dart';
import 'package:mim_generator/core/theme/palette.dart';
import 'package:social_share/social_share.dart';

class MimDetailView extends StatefulWidget {
  const MimDetailView({super.key});

  @override
  State<MimDetailView> createState() => _MimDetailViewState();
}

class _MimDetailViewState extends State<MimDetailView> {
  /// content key
  final GlobalKey contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetX<MimDetailController>(
      initState: (GetXState<MimDetailController> state) {
        state.controller!.setMeme = Get.find<MimListController>().meme;
        WidgetsBinding.instance.addPostFrameCallback((__) {
          state.controller!.setSize = contentKey.currentContext!.size!;
        });
      },
      builder: (_) {
        return Scaffold(
          appBar: MimAppBar(
            actions: [
              Visibility(
                visible: _.items.isNotEmpty && _.isEdit.value == true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: InkWell(
                    onTap: () {
                      _.setIsEdit = false;
                    },
                    child: Icon(
                      Icons.check,
                      color: Palette.d40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: WillPopScope(
            onWillPop: () async {
              if (_.isShare.value) {
                _.setIsShare = false;
              } else if (!_.isEdit.value) {
                _.setIsEdit = true;
              } else {
                Get.back();
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette.n20,
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: RepaintBoundary(
                      key: contentKey,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            _.meme.url,
                          ),
                          for(int i = 0; i < _.items.length; i++)
                            MimDragScaleWidget(
                              notifier: _.matrix[i],
                              height: _.size.height,
                              child: _.items[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _.isShare.value,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                        border: Border.all(
                          color: Palette.n30,
                        )
                      ),
                      child: Column(
                        children: [
                          Divider(
                            thickness: 1,
                            height: 0,
                            color: Palette.n30,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16, bottom: 8.0),
                              child: MimButton(
                                label: MimSentences.shareToFB,
                                labelColor: Colors.white,
                                color: Palette.d40,
                                loading: _.isLoading.value,
                                onPressed: () async {
                                  _.setIsLoading = true;
                                  String? path = await CommonUtils.captureWidget(
                                    contentKey: contentKey,
                                    context: context,
                                    saveToGallery: false,
                                  );
                                  if (path != null) {
                                    SocialShare.shareFacebookStory(
                                      appId: Api.appID,
                                      imagePath: path,
                                      backgroundTopColor: "#ffffff",
                                      backgroundBottomColor: "#000000",
                                    ).then((value) => print("Facebook result $value")).catchError((onError) {
                                      print("Error ngapa? $onError");
                                    });
                                  }
                                  _.setIsLoading = false;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width,
                            child: MimButton(
                              label: MimSentences.shareToTwitter,
                              labelColor: Colors.white,
                              color: Palette.d40,
                              loading: _.isLoading.value,
                              onPressed: () async {
                                _.setIsLoading = true;
                                String? url;
                                String? path = await CommonUtils.captureWidget(
                                  contentKey: contentKey,
                                  context: context,
                                  saveToGallery: false,
                                );
                                if (path != null) {
                                  url = await _.postMim(path);
                                } else {
                                  CommonUtils.snackBar(
                                    context: context,
                                    message: MimSentences.gagalMenguploadGambar,
                                  );
                                }
                                if (url != null) {
                                  SocialShare.shareTwitter(
                                    MimSentences.mimOriNihGess,
                                    url: url,
                                  );
                                } else {
                                  CommonUtils.snackBar(
                                    context: context,
                                    message: MimSentences.gagalMenguploadGambar,
                                  );
                                }
                                _.setIsLoading = false;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: !_.isShare.value,
            child: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConditionalWidget(
                  condition: _.isEdit.value,
                  builder: (context) {
                    return editorBar();
                  },
                  fallback: (context) {
                    return saveAndShare();
                  },
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget saveAndShare() {
    MimDetailController controller = Get.find<MimDetailController>();
    return Row(
      children: [
        Expanded(
          child: MimButton(
            label: MimWords.simpan,
            labelColor: Palette.d40,
            color: Colors.white,
            borderColor: Palette.d40,
            loading: controller.isLoading.value,
            onPressed: () async {
              controller.setIsLoading = true;
              await CommonUtils.captureWidget(
                contentKey: contentKey,
                context: context,
                saveToGallery: true,
              );
              controller.setIsLoading = false;
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: MimButton(
            label: MimWords.share,
            labelColor: Palette.d40,
            color: Colors.white,
            borderColor: Palette.d40,
            loading: controller.isLoading.value,
            onPressed: () async {
              controller.setIsShare = true;
            },
          ),
        ),
      ],
    );
  }

  Widget editorBar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: InkWell(
            onTap: () async {
              MimDetailController controller = Get.find<MimDetailController>();
              ImagePicker imagePicker = ImagePicker();
              XFile? file = await imagePicker.pickImage(
                source: ImageSource.gallery,
              );
              if (file != null) {
                controller.setMatrix = [...controller.matrix, ValueNotifier(Matrix4.identity())];
                Timer(const Duration(milliseconds: 100), () {
                  controller.setItems = Image.file(
                    File(file.path),
                  );
                });
              }
            },
            // Kasih border di InkWell supaya highlight dan splashnya
            // juga ikut terborder radius
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Palette.n20,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MimText(
                      MimSentences.addLogo,
                    ),
                  ),
                  Icon(
                    Icons.image,
                    color: Palette.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: InkWell(
            onTap: () {
              showModalAddText();
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Palette.n20,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MimText(
                      MimSentences.addText,
                    ),
                  ),
                  Icon(
                    Icons.title,
                    color: Palette.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.find<MimDetailController>().undo();
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.n20,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: MimText(
                    MimWords.undo,
                  ),
                ),
                Icon(
                  Icons.undo,
                  color: Palette.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showModalAddText() {
    Get.dialog(
      GetX<MimDetailController>(
        builder: (_) {
          return GestureDetector(
            // Kasih unfocus supaya user bisa nutup keyboard pas pencet
            // AlertDialog
            onTap: () => Get.focusScope!.unfocus(),
            child: ModalAddText(
              controller: _.mimTextController.value,
              selectedColor: _.color.value,
              onSetColor: (Color color) {
                _.color.value = color;
              },
              onClear: () {
                _.color.value = Colors.black;
                _.mimTextController.value.clear();
                Get.back();
              },
              onAdd: () {
                _.setMatrix = [..._.matrix, ValueNotifier(Matrix4.identity())];
                Timer(const Duration(milliseconds: 100), () {
                  _.setItems = Padding(
                    padding: const EdgeInsets.all(16),
                    child: MimText(
                      _.mimTextController.value.text,
                      size: 30,
                      color: _.color.value,
                    ),
                  );
                });
                Get.back();
              },
            ),
          );
        }
      ),
    );
  }
}