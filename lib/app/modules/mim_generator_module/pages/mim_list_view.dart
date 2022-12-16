import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mim_generator/app/data/models/mim_model.dart';
import 'package:mim_generator/app/modules/mim_generator_module/controllers/mim_list_controller.dart';
import 'package:mim_generator/app/modules/mim_generator_module/widgets/mim_widget.dart';
import 'package:mim_generator/app/widgets/mim_app_bar.dart';

class MimListView extends GetView<MimListController> {
  const MimListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MimAppBar(
        showLeading: false,
      ),
      body: GetX<MimListController>(
        initState: (state) {
          Get.find<MimListController>().getList();
        },
        builder: (_) {
          return RefreshIndicator(
            onRefresh: () async {
              _.refreshList();
            },
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 3,
                mainAxisSpacing: 2.5,
                crossAxisSpacing: 2.5,
              ),
              itemCount: _.mimList.length,
              itemBuilder: (context, index) {
                Meme meme = _.mimList[index];
                return MimWidget(
                  meme: meme,
                  onTap: (Meme meme) {
                    _.details(meme);
                  },
                );
              },
            ),
          );
        }
      ),
    );
  }
}