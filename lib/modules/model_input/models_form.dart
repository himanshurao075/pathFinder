import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:path_finder/Widgets/textfield.dart';
import 'package:path_finder/modules/model_input/models_controller.dart';

import '../../routes/app_pages.dart';

class ModelsFormView extends GetView<ModelsHomeController> {
  const ModelsFormView({super.key});
  // @override
  // get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Model"),
      ),
      body: GetBuilder<ModelsHomeController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeOutlineFormFiled(
                  labelText: "Title",
                  initialValue: controller.carrerModel.title,
                  onChanged: (val) {
                    controller.carrerModel.title = val;
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
                  Process process = controller.carrerModel.proccess[pindex];
                  return Card(
                    key: GlobalKey(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Process ${pindex + 1}",
                                style: const TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton.icon(
                                  onPressed: () {
                                    controller.carrerModel.proccess
                                        .removeAt(pindex);
                                    controller.update();
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
                                                process
                                                    .sources[sindex].type.icon,
                                                color: process
                                                    .sources[sindex].type.color,
                                              ),
                                              deleteIcon: const Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              ),
                                              onDeleted: () {
                                                controller.carrerModel
                                                    .proccess[pindex].sources
                                                    .removeAt(sindex);
                                                controller.update();
                                              },
                                              label: Text(process
                                                  .sources[sindex].title),
                                            )),
                                    TextButton(
                                      child: const Text("+ Add Sources"),
                                      onPressed: () async {
                                        SourceModel source = SourceModel();
                                        final GlobalKey<FormState> key =
                                            GlobalKey<FormState>();
                                        SourceModel result =
                                            await Get.dialog(SimpleDialog(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Form(
                                                key: key,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomeOutlineFormFiled(
                                                        labelText: "Label",
                                                        initialValue:
                                                            source.title,
                                                        onChanged: (val) {
                                                          source.title = val;
                                                        }),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomeOutlineFormFiled(
                                                        labelText: "Link",
                                                        initialValue:
                                                            source.link,
                                                        onChanged: (val) {
                                                          source.link = val;
                                                        }),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                        "Select Link Type"),
                                                    DropdownButton<MediaType>(
                                                        hint: const Text(
                                                            "Link Type"),
                                                        value: source.type,
                                                        isExpanded: true,
                                                        items: MediaType.values
                                                            .map((e) => DropdownMenuItem<
                                                                    MediaType>(
                                                                value: e,
                                                                child: Text(e
                                                                    .name
                                                                    .toUpperCase())))
                                                            .toList(),
                                                        onChanged: (val) {
                                                          source.type = val!;
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
                                                          child: const Text(
                                                              "Okay")),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                                        print(
                                            "A-========== ${process.sources.length}");

                                        process.sources = [
                                          ...process.sources,
                                          result
                                        ];
                                        controller.update();

                                        print(
                                            "B-========== ${process.sources.length}");
                                        // process.sources.add(result);
                                        // controller
                                        //     .carrerModel.proccess[pindex].sources
                                        //     .add(result);
                                        // controller
                                        //     .carrerModel.proccess[pindex].sources
                                        //     .add(source);
                                        // controller.update();
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
                          controller.carrerModel.proccess.add(Process());
                          controller.update();
                        },
                        child: const Text(" + Add Process")),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    final model = controller.carrerModel;
                    print("Title : ${model.title}");
                    print("=========================");
                    print("Meaning : ${model.meaning}");
                    print("=========================");

                    print("Scope : ${model.scope}");

                    print("=========================");
                    print("Function : ${model.function}");

                    print("=========================");
                    print("Pakcage : ${model.package}");

                    print("=========================");
                    print("qualites : ${model.qualites}");
                    print("=========================");
                    int count = 1;
                    model.proccess.forEach((element) {
                      print("Process == $count");
                      print("title ${element.title}");
                      print("description ${element.description}");
                      count += 1;
                    });
                  },
                  child: Text("Submit"),
                )
              ],
            ),
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