import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:get/get.dart';
import 'package:path_finder/Models/gptResponseModel.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final totalProcess = 0.obs;
  final selectedTabIndex = 0.obs;
  final isOtherSelected = false.obs;
  final isLoading = false.obs;
  final live = TextEditingController().obs;
  final who = TextEditingController().obs;
  final age = TextEditingController().obs;

  final dropDownModelList = [
    DropDownCarrerModel(label: "MBA", model: mbaModel),
    DropDownCarrerModel(
      label: "Other",
      model: CarrerModel(),
    )
  ];

  final selectedCareerModel = Rx<DropDownCarrerModel?>(null);
  final scrollController = ScrollController().obs;
  final process = RxList<Process>();

  onClickNext() {
    if (totalProcess.value !=
        selectedCareerModel.value?.model.proccess.length) {
      totalProcess.value += 1;
      process.add(
          selectedCareerModel.value!.model.proccess[totalProcess.value - 1]);
      scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent + 400,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  final selectedTemplate = 0.obs;

  void onSelectedTemplate(int index) {
    selectedTemplate.value = index;
  }
}

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
  ],
);

List<SourceModel> sources = [
  SourceModel(
      prefix: const Icon(CupertinoIcons.globe),
      title: "About Flutter",
      link:
          "https://www.google.com/search?q=flutter+sdk&oq=flutter+sdk&aqs=chrome..69i57j0i433i512j0i512l8.8032j0j7&sourceid=chrome&ie=UTF-8",
      type: MediaType.link),
  SourceModel(
      title: "Introduction",
      prefix: const Icon(
        CupertinoIcons.videocam_circle,
        color: Colors.blue,
      ),
      link: "https://www.youtube.com/watch?v=XeG1sEQitLk",
      type: MediaType.video),
  SourceModel(
      title: "Document",
      prefix: const Icon(
        Icons.picture_as_pdf_rounded,
        color: Colors.red,
      ),
      link: "https://www.africau.edu/images/default/sample.pdf",
      type: MediaType.pdf),
  SourceModel(
      prefix: const Icon(
        Icons.image,
        color: Colors.blue,
      ),
      title: "Hotel Image",
      link:
          "https://www.homelane.com/blog/wp-content/uploads/2022/11/bungalow-interiors.jpg",
      type: MediaType.image),
];

Future<DropDownCarrerModel> fetchModelFromAI(
    DropDownCarrerModel model, String who, String live, String age) async {
  String prompt =
      "you are a Counsellor ,${who.isEmpty ? "" : "I am $who and "}${live.isEmpty ? "" : "I live in $live and "}${age.isEmpty ? "" : " my age is $age and "}i want to become a ${model.label} give me guidence how can i become it in json format step by step also give me the meaning , scope, package , function, Qualities, of ${model.label}.all step should be in string format";
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
      model = await fetchModelFromAI(model, who, live, age);
    }
  } catch (e) {
    print("Some Exception Occur :$e");
  } finally {
    client.close();
  }

  return model;
}
