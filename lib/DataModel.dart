import 'package:flutter/material.dart';

class CarrerModel {
  CarrerModel(
      {this.title = '',
      this.qualites = '',
      this.function = '',
      this.scope = '',
      this.package = '',
      this.meaning = '',
      this.proccess = const []});
  String title;
  String meaning;
  String function;
  String scope;
  String package;
  String qualites;

  List<Process> proccess;
}

class Process {
  Process(
      {this.description = '',
      this.title = '',
      this.prefixIcon,
      this.sources = const []});
  IconData? prefixIcon;
  String description;
  String title;
  List<SourceModel> sources;
}

class SourceModel {
  SourceModel({
    this.prefix,
    this.title = '',
    this.link = '',
    this.type = MediaType.link,
  });
  Widget? prefix;
  String title;
  String link;
  MediaType type;
}

enum MediaType { audio, video, image, pdf, link }

class DropDownCarrerModel {
  DropDownCarrerModel({required this.label, required this.model});
  String label;
  CarrerModel model;
}
