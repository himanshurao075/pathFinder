import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class Id {
  String oid;

  Id({
    required this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class CarrerModel {
  CarrerModel(
      {this.title = '',
      this.qualites = '',
      this.function = '',
      this.scope = '',
      this.package = '',
      this.meaning = '',
      this.id,
    
      this.proccess = const []});
  Id? id;
  String title;
  String meaning;
  String function;
  String scope;
  String package;
  String qualites;

  List<Proccess> proccess;
factory CarrerModel.fromJson(Map<String, dynamic> json) => CarrerModel(
        id: Id.fromJson(json["_id"]),
        function: json["function"],
        meaning: json["meaning"],
        package: json["package"],
        proccess: List<Proccess>.from(
            json["proccess"].map((x) => Proccess.fromJson(x))),
        qualites: json["qualites"],
        scope: json["scope"],
        title: json["title"],
      );


  
  Map<String, dynamic> toJson() => {
        // "_id": id.toJson(),
        "title": title,
        "meaning": meaning,
        "function": function,
        "scope": scope,
        "package": package,
        "qualites" : qualites,
        "proccess": List<dynamic>.from(proccess.map((x) => x.toJson()))
      };
}

class Proccess {
  Proccess(
      {this.description = '',
      this.title = '',
      this.prefixIcon,
      this.sources = const []});
  IconData? prefixIcon;
  String description;
  String title;
  List<SourceModel> sources;
  
  factory Proccess.fromJson(Map<String, dynamic> json) => Proccess(
        description: json["description"]??'',
        prefixIcon: IconData(json["prefix_icon"],fontFamily:  'MaterialIcons'),
        sources:
            List<SourceModel>.from(json["sources"].map((x) => SourceModel.fromJson(x))),
        title: json["title"]??'',
      );


   Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "prefix_icon": prefixIcon?.codePoint??0,
        "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
         };

}

class SourceModel {
  SourceModel({
    // this.prefix,
    this.title = '',
    this.link = '',
    this.type = MediaType.link,
  });
  // Widget? prefix;
  String title;
  String link;
  MediaType type;


   factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        link: json["link"]??'',
        title: json["title"]??'',
        type: MediaType.values.byName(json["type"]),
      );

   Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "type": type.name,
         };
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
