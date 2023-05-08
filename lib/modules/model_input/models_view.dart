import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:path_finder/modules/model_input/models_controller.dart';

import '../../routes/app_pages.dart';

class ModelsHomeView extends GetView<ModelsHomeController> {
  const ModelsHomeView({super.key});
  @override
  get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Models View Home"),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                Get.toNamed(Routes.modelsForm);
              },
              icon: Icon(Icons.add),
              label: Text("Add New Model"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.models.length,
          itemBuilder: (context, index) {
            final item = controller.models[index];
            return ListTile(
              title: Text(item.title),
            );
          },
        ),
      ),
    );
  }
}