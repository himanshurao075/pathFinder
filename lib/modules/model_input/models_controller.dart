import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/DataModel.dart';
import '../Home/homeController.dart';

class ModelsHomeController extends GetxController {
  CarrerModel carrerModel = CarrerModel(proccess: [Process()]);
  List<CarrerModel> models = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    models.add(mbaModel);
 
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
