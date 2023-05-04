import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:path_finder/Utils/colors.dart';

class CustomDropFiled extends StatelessWidget {
  const CustomDropFiled({
    super.key,
    required this.label,
    this.hintText = "Select",
    required this.onChanged,
    required this.value,
    required this.dropDownModelList,
  });

  final String label;
  final String hintText;
  final DropDownCarrerModel? value;
  final List<DropDownCarrerModel> dropDownModelList;
  final Function(DropDownCarrerModel? value) onChanged;

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
                color: NewCustomColorPlatte().headingColor,
              ),
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
                    hint: Text(hintText),
                    onChanged: onChanged,
                    items:dropDownModelList
                        .map(
                          (e) => DropdownMenuItem<DropDownCarrerModel>(
                            value: e,
                            child: Text(e.label),
                          ),
                        )
                        .toList(),
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
