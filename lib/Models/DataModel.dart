import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

enum MediaType {
  audio('Audio', CupertinoIcons.music_note_2,Colors.blue),
  video('Video',  CupertinoIcons.videocam_circle, Colors.blue,),
  image('Image',  Icons.image,
         Colors.blue),
  pdf('PDF', Icons.picture_as_pdf_rounded,
     Colors.red,
  ),
  link('Link', CupertinoIcons.globe, Colors.blue);

  const MediaType(this.label, this.icon,this.color);
  final String label;
  final IconData icon;
  final Color color;
}

class DropDownCarrerModel {
  DropDownCarrerModel({required this.label, required this.model});
  String label;
  CarrerModel model;
}
