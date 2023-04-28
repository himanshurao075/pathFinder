import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_finder/DataModel.dart';
import 'package:path_finder/DetailsTemplate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuestionaryScreen(),
      // home: const DetailsTemplate(),
    );
  }
}

class QuestionaryScreen extends StatefulWidget {
  const QuestionaryScreen({super.key});

  @override
  State<QuestionaryScreen> createState() => _QuestionaryScreenState();
}

class _QuestionaryScreenState extends State<QuestionaryScreen> {
  DropDownCarrerModel? selectedModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
            // color: Colors.red,
            height: size.height * 0.8,
            width: size.width * 0.6,
            child: Center(
                child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.lightBlue, width: 3),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Tell me about yourself...",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textScaleFactor: 2,
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "This details can help me to suggest best career path for you.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomeDropFiled(
                                      label: "What you want to become?",
                                      value: selectedModel,
                                      onChanged: (val) {
                                        selectedModel = val;

                                     
                                        setState(() {
                                          
                                        });
                                      })),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                child: CustomeTextFiled(
                                  label: "What is your age?",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomeTextFiled(
                            label: "Where you live?",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomeTextFiled(
                            label: "Who you are?",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomeTextFiled(
                            label: "In which class you study",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Do you want assessment test to check your capability",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                  onPressed: selectedModel == null
                                      ? null
                                      : () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsTemplate(
                                                        model: selectedModel!),
                                              ));
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
                    )))),
      ),
    );
  }
}

class CustomeTextFiled extends StatelessWidget {
  const CustomeTextFiled({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
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
                  color: Colors.lightBlue.shade50),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
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
  const CustomeDropFiled(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.value});
  final String label;
  final DropDownCarrerModel? value;

  final Function(DropDownCarrerModel value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          .toList(),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}

final dropDownModelList = [DropDownCarrerModel(label: "MBA", model: mbaModel)];

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
