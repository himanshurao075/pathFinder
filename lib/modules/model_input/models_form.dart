import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:path_finder/Widgets/textfield.dart';
import 'package:path_finder/modules/Home/homeView.dart';
import 'package:path_finder/modules/model_input/models_controller.dart';

import '../../routes/app_pages.dart';
import 'ModelsHomeScreen.dart';

class ModelsFormView extends GetView<ModelsHomeController> {
  const ModelsFormView({super.key});
  // @override
  // get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Model"),
        actions: [
          TextButton.icon(
              onPressed: () {
                controller.update();
              },
              icon: const Icon(Icons.refresh,color: Colors.white,),
              label: const Text("Refresh",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      ),
      body: GetBuilder<ModelsHomeController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
               Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomeOutlineFormFiled(
                          labelText: "Title",
                          initialValue: controller.carrerModel.title,
                          onChanged: (val) {
                            controller.carrerModel.title = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeOutlineFormFiled(
                          labelText: "Meaning",
                          maxLines: 3,
                          initialValue: controller.carrerModel.meaning,
                          onChanged: (val) {
                            controller.carrerModel.meaning = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeOutlineFormFiled(
                          labelText: "Scope",
                          initialValue: controller.carrerModel.scope,
                          maxLines: 3,
                          onChanged: (val) {
                            controller.carrerModel.scope = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeOutlineFormFiled(
                          labelText: "Package",
                          initialValue: controller.carrerModel.package,
                          maxLines: 3,
                          onChanged: (val) {
                            controller.carrerModel.package = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeOutlineFormFiled(
                          labelText: "Function",
                          initialValue: controller.carrerModel.function,
                          maxLines: 3,
                          onChanged: (val) {
                            controller.carrerModel.function = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeOutlineFormFiled(
                          labelText: "Qualties",
                          initialValue: controller.carrerModel.qualites,
                          maxLines: 3,
                          onChanged: (val) {
                            controller.carrerModel.qualites = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Divider(
                          color: Colors.teal,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ...List.generate(controller.carrerModel.proccess.length,
                            (pindex) {
                          Proccess process =
                              controller.carrerModel.proccess[pindex];
                          return Card(
                            elevation: 5,
                            key: GlobalKey(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Proccess ${pindex + 1}",
                                        style: const TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton.icon(
                                          onPressed: () {
                                            controller.carrerModel.proccess
                                                .removeAt(pindex);
                                            
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          label: const Text(
                                            "Remove",
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomeOutlineFormFiled(
                                      labelText: "Title",
                                      initialValue: process.title,
                                      onChanged: (val) {
                                        process.title = val;
                                        
                                      }),
                                  // TextFormField(
                                  //   decoration: const InputDecoration(
                                  //     hintText: "Title",
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomeOutlineFormFiled(
                                      labelText: "Description",
                                      initialValue: process.description,
                                      onChanged: (val) {
                                        process.description = val;
                                        
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                
                                  Row(
                                    children: [
                                      Wrap(
                                          runSpacing: 5,
                                          spacing: 10,
                                          alignment: WrapAlignment.start,
                                          children: [
                                            ...List.generate(
                                                process.sources.length,
                                                (sindex) => Chip(
                                                      backgroundColor:
                                                          Colors.teal.shade50,
                                                      avatar: Icon(
                                                        process.sources[sindex]
                                                            .type.icon,
                                                        color: process
                                                            .sources[sindex]
                                                            .type
                                                            .color,
                                                      ),
                                                      deleteIcon: const Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                      ),
                                                      onDeleted: () {
                                                        controller
                                                            .carrerModel
                                                            .proccess[pindex]
                                                            .sources
                                                            .removeAt(sindex);
                                                        controller.update();
                                                      },
                                                      label: Text(process
                                                          .sources[sindex].title),
                                                    )),
                                            TextButton(
                                              child: const Text("+ Add Sources"),
                                              onPressed: () async {
                                                SourceModel source =
                                                    SourceModel();
                                                final GlobalKey<FormState> key =
                                                    GlobalKey<FormState>();
                                                SourceModel result =
                                                    await Get.dialog(SimpleDialog(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Form(
                                                        key: key,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomeOutlineFormFiled(
                                                                labelText:
                                                                    "Label",
                                                                initialValue:
                                                                    source.title,
                                                                onChanged: (val) {
                                                                  source.title =
                                                                      val;
                                                            controller
                                                                      .update();
                                                                }),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            CustomeOutlineFormFiled(
                                                                labelText: "Link",
                                                                initialValue:
                                                                    source.link,
                                                                onChanged: (val) {
                                                                  source.link =
                                                                      val;
                                                                      controller
                                                                      .update();
                                                                }),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            const Text(
                                                                "Select Link Type"),
                                                            DropdownButton<
                                                                    MediaType>(
                                                                hint: const Text(
                                                                    "Link Type"),
                                                                value:
                                                                    source.type,
                                                                isExpanded: true,
                                                                items: MediaType
                                                                    .values
                                                                    .map((e) => DropdownMenuItem<
                                                                            MediaType>(
                                                                        value: e,
                                                                        child: Text(e
                                                                            .name
                                                                            .toUpperCase())))
                                                                    .toList(),
                                                                onChanged: (val) {
                                                                  source.type =
                                                                      val!;
                                                                      controller
                                                                      .update();
                                                                }),
                                                            Center(
                                                              child: TextButton(
                                                                  onPressed: () {
                                                                    if (key
                                                                        .currentState!
                                                                        .validate())
                                                                      Get.back(
                                                                          result:
                                                                              source);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          "Okay")),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ));
                
                                                process.sources = [
                                                  ...process.sources,
                                                  result
                                                ];
                                                controller.update();
                                              },
                                            )
                                          ]),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.carrerModel.proccess.add(Proccess());
                                  controller.update();
                                },
                                child: const Text(" + Add Proccess")),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // controller.models = [...controller.models, co];
                            final result = await controller.addModels();
                            if (result) {
                              controller.carrerModel = CarrerModel();
                              Get.toNamed(Routes.modelsHome);
                            }
                          },
                          child: const Text("Submit"),
                        )
                      ],
                    ),
                  ),
                ),
              ),Container(color: Colors.teal,width: 5,height: double.infinity,),
              Expanded(
                flex: 6,
                  child: ModelsHomeScreen(
                                model: controller.carrerModel,
                              )),
                ],
          ),
        ),
      ),
    );
  }
}

class CustomeOutlineFormFiled extends StatelessWidget {
  CustomeOutlineFormFiled(
      {super.key,
      required this.labelText,
      required this.initialValue,
      this.maxLines,
      required this.onChanged});
  final String labelText;
  final String initialValue;
  int? maxLines = 1;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
