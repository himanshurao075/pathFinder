import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_finder/DataModel.dart';
import 'package:path_finder/DetailsTemplate2.dart';
import 'package:path_finder/colors.dart';

import 'gpt4ResponseModel.dart';

class QuestionaryScreen extends StatefulWidget {
  const QuestionaryScreen({super.key});

  @override
  State<QuestionaryScreen> createState() => _QuestionaryScreenState();
}

class _QuestionaryScreenState extends State<QuestionaryScreen> {
  DropDownCarrerModel? selectedModel;
  bool isOtherSelected = false;
  bool isLoading = false;
  TextEditingController live = TextEditingController();
  TextEditingController who = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            // color: Colors.red,
            height: size.height * 0.8,
            width: size.width * 0.6,
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              progressIndicator: CircularProgressIndicator(
                color: NewCustomeColorPlatte().pink,
              ),
              child: Center(
                  child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: NewCustomeColorPlatte().blueColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: NewCustomeColorPlatte().blueColor,
                              width: 3),
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
                                      color:
                                          NewCustomeColorPlatte().headingColor,
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
                                    color: NewCustomeColorPlatte().textColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: isOtherSelected
                                        ? CustomeTextFiled(
                                            onChanged: (val) {
                                              selectedModel =
                                                  DropDownCarrerModel(
                                                      label: val,
                                                      model: CarrerModel());
                                            },
                                            label: "What you want to become?",
                                            hint: "Enter....")
                                        : CustomeDropFiled(
                                            label: "What you want to become?",
                                            value: selectedModel,
                                            onChanged: (val) {
                                              if (val.label == "Other") {
                                                isOtherSelected = true;
                                              } else {
                                                selectedModel = val;
                                              }
                                              setState(() {});
                                            })),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: CustomeTextFiled(
                                    hint: "Enter....",
                                    label: "What is your age?",
                                    controller: age,
                                    onChanged: (val) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomeTextFiled(
                                onChanged: (val) {},
                                label: "Where you live?",
                                controller: live,
                                hint: "Enter...."),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomeTextFiled(
                                onChanged: (val) {},
                                label: "Who you are?",
                                controller: who,
                                hint: "Enter...."),
                            const SizedBox(
                              height: 20,
                            ),
                            // CustomeTextFiled(
                            //   onChanged: (val) {},
                            //   hint: "Enter....",
                            //   label: "In which class you study",
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Row(
                              children: [
                                Text(
                                  "Do you want assessment test to check your capability",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          NewCustomeColorPlatte().headingColor),
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
                                ElevatedButton(
                                    onPressed: selectedModel == null &&
                                            isOtherSelected == false
                                        ? null
                                        : () async {
                                            isLoading = true;
                                            setState(() {});
                                            if (!isOtherSelected) {
                                              isLoading = false;
                                              setState(() {});
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsTemplate2(
                                                            model:
                                                                selectedModel!),
                                                  ));
                                            } else {
                                              selectedModel =
                                                  await fetchModelFromAI(
                                                      selectedModel!);
                                              isLoading = false;
                                              setState(() {});
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsTemplate2(
                                                            model:
                                                                selectedModel!),
                                                  ));
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        backgroundColor: Colors.pink),
                                    child: const Text("Submit"))
                              ],
                            )
                          ],
                        ),
                      ))),
            )),
      ),
    );
  }

  Future<DropDownCarrerModel> fetchModelFromAI(
      DropDownCarrerModel model) async {
    String prompt =
        "you are a Counsellor ,${who.text.isEmpty ? "" : "I am ${who.text} and "}${live.text.isEmpty ? "" : "I live in ${live.text} and "}${age.text.isEmpty ? "" : " my age is ${age.text} and "}i want to become a ${model.label} give me guidence how can i become it in json format step by step also give me the meaning , scope, package , function, Qualities, of ${model.label}.all step should be in string format";
    print(prompt);
    var data = {
      "model": "text-davinci-003",
      "prompt":
          "i want to become a ${model.label} give me guidence how can i become it in json format step by step also give me the meaning , scope, package , function, Qualities, of ${model.label}.all step should be in string format",
      "temperature": 0,
      "max_tokens": 1500,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    };
    var client = http.Client();
    try {
      final headers = {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer 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"
      };
      var response = await client.post(
          Uri.parse("https://api.openai.com/v1/completions"),
          headers: headers,
          body: jsonEncode(data));
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      final responseString = decodedResponse["choices"][0]["text"];

      final respJson = jsonDecode(responseString);
      print("=========");
      print(respJson);
      final respModel = Gpt4Response.fromJson(respJson);
      model.model.title = model.label;
      model.model.meaning = respModel.meaning;
      model.model.function = respModel.functions;
      model.model.scope = respModel.scope;
      model.model.package = respModel.package;
      model.model.qualites = respModel.qualities;

      model.model.proccess =
          respModel.steps.map((e) => Process(description: e)).toList();
      if (model.model.meaning.isEmpty ||
          model.model.scope.isEmpty ||
          // model.model.function.isEmpty ||
          model.model.package.isEmpty ||
          model.model.qualites.isEmpty ||
          model.model.proccess.isEmpty) {
        model = await fetchModelFromAI(model);
      }
    } catch (e) {
      print("Some Exception Occur :$e");
    } finally {
      client.close();
    }

    return model;
  }
}




class CustomeTextFiled extends StatelessWidget {
  const CustomeTextFiled(
      {super.key,
      required this.label,
      this.hint,
      required this.onChanged,
      this.controller});
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewCustomeColorPlatte().headingColor),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: NewCustomeColorPlatte().blueColor.withOpacity(0.1)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller,
                    onChanged: (val) {
                      onChanged(val);
                    },
                    decoration: InputDecoration(
                        hintText: hint,
                        border: InputBorder.none,
                        focusColor: Colors.lightBlue.shade50,
                        hoverColor: Colors.lightBlue.shade50,
                        fillColor: Colors.lightBlue.shade50),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomeDropFiled extends StatelessWidget {
  CustomeDropFiled(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.value});
  final String label;
  final DropDownCarrerModel? value;

  final Function(DropDownCarrerModel value) onChanged;
  // final DropDownCarrerModel other =
  //     DropDownCarrerModel(label: "Other", model: CarrerModel());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewCustomeColorPlatte().headingColor),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue.shade50),
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownButton<DropDownCarrerModel>(
                        isExpanded: true,
                        isDense: true,
                        value: value,
                        hint: const Text("Select"),
                        onChanged: (DropDownCarrerModel? val) {
                          onChanged(val!);
                        },
                        items: dropDownModelList
                            .map((e) => DropdownMenuItem<DropDownCarrerModel>(
                                value: e, child: Text(e.label)))
                            .toList())),
              ),
            ),
          ),
        )
      ],
    );
  }
}

final dropDownModelList = [
  DropDownCarrerModel(label: "MBA", model: mbaModel),
  // DropDownCarrerModel(label: "Other", model: CarrerModel())
];

CarrerModel mbaModel = CarrerModel(
    title: "MBA - Master of Business Administration",
    function:
        "MBA graduates are trained to be effective leaders and managers in a variety of industries. They are equipped with the skills to analyze complex business problems, develop innovative solutions, and make sound decisions. Additionally, MBA programs often focus on teaching students how to communicate effectively, work collaboratively, and think critically.",
    meaning:
        "MBA stands for Master of Business Administration, which is a postgraduate degree that teaches students a wide range of business skills and management concepts. It is a highly sought-after degree for individuals who want to develop their leadership skills and advance their careers in the business world",
    package:
        "The salary package for MBA graduates can vary depending on the industry, location, and experience level. However, according to PayScale, the average salary for MBA graduates in the United States is around \$87,000 per year.",
    qualites:
        "The qualities that an MBA program can provide to students include a solid foundation in business concepts, critical thinking skills, communication skills, leadership skills, and networking opportunities. Additionally, an MBA can enhance a student's credibility in the job market and increase their earning potential.",
    scope:
        "The scope of an MBA is vast and varied. Graduates can pursue a wide range of careers in fields such as finance, consulting, marketing, human resources, and entrepreneurship. Additionally, MBA programs are available both online and in-person, making them accessible to students from all over the world",
    proccess: [
      Process(
          prefixIcon: CupertinoIcons.book_solid,
          title: "10th Standard Examination",
          description:
              "Pass Your 10th Exam With Maths, Logical Reasoning, English, Current Affairs",
          sources: sources),
      Process(
          prefixIcon: CupertinoIcons.book_solid,
          title: "12th Standard Examination",
          description:
              "Pass 12th Class with Maths & English as your core subject with certainly above 95% Score."),
      Process(
          prefixIcon: Icons.school,
          title: "BBA/B.COM",
          description:
              "Either opt for BBA, BCOM or Any other College Degree\nBBA -> University + Colleges + City + Fee\nB.COM -> University + Colleges + City + Fee",
          sources: sources),
      Process(
          prefixIcon: Icons.find_in_page,
          title: "Entrance Examination",
          sources: sources,
          description: "Get Ready for CAT, MAT, SNAP, IRMA, ZAT"),
      Process(
          sources: sources,
          prefixIcon: CupertinoIcons.airplane,
          title: "For study in abroad",
          description: "Prepare for ZAT + IELTS + TOFFLS"),
      Process(
          sources: sources,
          prefixIcon: Icons.feedback,
          title: "Recommentation & Suggestions ",
          description: "Collegs :  College Data + City Data +"),
      Process(
          sources: sources,
          prefixIcon: Icons.work,
          title: "Placementes",
          description: "Placements + Companies + package"),
    ]);
