import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:path_finder/modules/model_input/models_controller.dart';

import '../../routes/app_pages.dart';

class ModelsHomeView extends GetView<ModelsHomeController> {
  const ModelsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Models View Home"),
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                await Get.toNamed(Routes.modelsForm);
                controller.update();
              },
              icon: Icon(Icons.add),
              label: Text("Add New Model"))
        ],
      ),
      body: GetBuilder<ModelsHomeController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.models.length,
            itemBuilder: (context, index) {
              final item = controller.models[index];
              return ListTile(
                title: Text(item.title),
                subtitle: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.home);
                  },
                  child: Text("View Model"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
