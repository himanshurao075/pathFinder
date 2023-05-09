import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Widgets/dropdown.dart';
import 'package:path_finder/Widgets/textfield.dart';
import '../../Widgets/buttons.dart';
import '../../routes/app_pages.dart';
import 'homeController.dart';

class FormScreen extends GetView<HomeController> {
  const FormScreen({Key? key}) : super(key: key);
  @override
  // TODO: implement controller
  HomeController get c => super.controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body:  Center(
          child: SizedBox(
              height: size.height * 0.8,
              width: size.width * 0.6,
              child: ModalProgressHUD(
                inAsyncCall: c.isLoading.value,
                progressIndicator: CircularProgressIndicator(
                  color: NewCustomColorPlatte().pink,
                ),
                child: Center(
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: NewCustomColorPlatte().blueColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: NewCustomColorPlatte().blueColor, width: 3),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tell me about yourself...",
                                style: TextStyle(
                                    color: NewCustomColorPlatte().headingColor,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 2,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "This details can help me to suggest best career path for you.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: NewCustomColorPlatte().textColor,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              if (c.isOtherSelected.value)
                                Expanded(
                                  child: CustomTextFiled(
                                      onChanged: (val) {
                                        c.selectedCareerModel.value =
                                            DropDownCarrerModel(
                                          label: val,
                                          model: CarrerModel(),
                                        );
                                      },
                                      label: "What you want to become?",
                                      hint: "Enter...."),
                                ),
                              if (!c.isOtherSelected.value)
                                Expanded(
                                  child: CustomDropFiled(
                                    label: "What you want to become?",
                                    value: c.selectedCareerModel.value,
                                    onChanged: (value) {
                                      if (value?.label == "Other") {
                                        c.isOtherSelected.value = true;
                                      } else {
                                        c.selectedCareerModel.value = value;
                                      }
                                    },
                                    dropDownModelList: c.dropDownModelList,
                                  ),
                                ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomTextFiled(
                                  hint: "Enter....",
                                  label: "What is your age?",
                                  controller: c.age.value,
                                  onChanged: (val) {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFiled(
                            onChanged: (val) {},
                            label: "Where you live?",
                            controller: c.live.value,
                            hint: "Enter....",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFiled(
                              onChanged: (val) {},
                              label: "Who you are?",
                              controller: c.who.value,
                              hint: "Enter...."),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Do you want assessment test to check your capability",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: NewCustomColorPlatte().headingColor),
                              ),
                              Switch(
                                  activeColor: Colors.pink,
                                  value: true,
                                  onChanged: (val) {})
                            ],
                          ),
                          const Spacer(),
                          const Divider(
                            color: Colors.pink,
                            thickness: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              CustomElevatedButton(
                                onPressed: c.selectedCareerModel.value == null
                                    ? null
                                    : () async {
                                        c.isLoading.value = true;

                                        if (!c.isOtherSelected.value) {
                                          c.isLoading.value = false;
                                          var value = c.selectedCareerModel
                                              .value?.model.proccess;
                                          if (value?.isNotEmpty ?? false) {
                                            c.process.add(value!.first);
                                          }
                                          Get.toNamed(Routes.home);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         HomeScreen(),
                                          //   ),
                                          // );
                                        } else {
                                          c.selectedCareerModel.value =
                                              await fetchModelFromAI(
                                            c.selectedCareerModel.value!,
                                            c.who.value.text,
                                            c.live.value.text,
                                            c.age.value.text,
                                          );
                                          c.isLoading.value = false;
                                          Get.toNamed(Routes.home);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         HomeScreen(),
                                          //   ),
                                          // );
                                        }
                                      },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
    
      );
    });
  }
}
